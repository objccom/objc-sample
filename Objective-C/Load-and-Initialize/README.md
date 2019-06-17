# Objective-C 中关于类的load 和initialize 方法

### 简介
Objective-C作为一门面向对象语言，有类和对象的概念。所有的代码在执行编译后，类相关的数据结构会保留在目标文件中，在运行时得到解析和使用。在应用程序运行起来的时候，类的信息会有加载和初始化过程。类的加载和初始化过程中，就使用到了`+load`和`+initialize`两个类方法；而在`NSObject`根类中，前两个方法也是`load`和`initialize`两个类方法，本文就对这两个特殊方法的区别与联系、使用场景和注意事项做一个详细的记录。

`NSObject`类中这两个方法的声明

```objc
@interface NSObject <NSObject>
...
+ (void)load;
+ (void)initialize;

...
@end
```

### `+load`方法
顾名思义，`load`方法在这个文件被程序装载时调用。只要是在Compile Sources中出现的文件总是会被装载，这与这个类是否被用到无关。在一个程序开始运行之前（在`main`函数开始执行之前），类文件开始被程序加载，`load`方法就会开始被执行；因此`load`方法总是在`main`函数之前调用。

- 调用规则
当父类和子类都实现`load`方法时，父类的`load`方法会被先执行。`load`方法是系统自动加载的，因此不需要使用`[spur load]`方法调用父类的`load`方法，否则父类的`load`方法会多次执行。值得注意的是在分类中重载`load`方法是不会替换宿主类中的`load`方法的，宿主类和分类中的`load`方法都会被执行，宿主类的`load`方法会先被执行，再执行分类中的`load`方法。当有多个分类都实现了`load`方法，在Compile Sources中文件的排放顺序就是这几个`load`方法装载顺序。特别注意的是：如果一个类没有实现`load`方法，那么就不会调用它父类的`load`方法。

下面的示例创建了2个类和3个分类，其中`Woman`类继承自`People`类，另外3个分类均为`Woman`类的扩展分类，这三个分类添加的顺序为`Woman (XYLoad)` - `Woman (XYLoad1)` - `Woman (XYLoad2)`（时间升序）。
```objc

@implementation People

+ (void)load {
    NSLog(@"%s", __func__);
}

@end

@implementation Woman

+ (void)load {
    NSLog(@"%s", __func__);
}

@end

@implementation Woman (XYLoad)

+ (void)load {
    NSLog(@"%s", __func__);
}

@end

@implementation Woman (XYLoad1)

+ (void)load {
    NSLog(@"%s", __func__);
}

@end

@implementation Woman (XYLoad2)

+ (void)load {
    NSLog(@"%s", __func__);
}

@end

```

`load`方法执行顺序的结果
```
2019-06-17 12:50:17.470910+0800 Load-and-Initialize[8957:148744] +[Woman load]
2019-06-17 12:50:17.471639+0800 Load-and-Initialize[8957:148744] +[People load]
2019-06-17 12:50:17.471705+0800 Load-and-Initialize[8957:148744] +[Woman(XYLoad2) load]
2019-06-17 12:50:17.471796+0800 Load-and-Initialize[8957:148744] +[Woman(XYLoad1) load]
2019-06-17 12:50:17.471897+0800 Load-and-Initialize[8957:148744] +[Woman(XYLoad) load]
```

对于`load`方法执行顺序需要注意的地方，下图为`Compile Sources`中类和分类的排放顺序：
![屏幕快照2019-06-17下午12.57.59.png](https://static.kuwe.top/2019/6/IhyLbguIRScoUiaWU8SSQPgxhfG1nGmT1BwyjJz0Vzg7jS90EHfFn0FjFjwIV7x4 "屏幕快照2019-06-17下午12.57.59.png")



在上文中也提到过，在`Compile Sources`中文件的排放顺序就是`load`方法装载顺序。从打印日志来看，`People`的`load`方法先于`Woman`调用，而它在`Compile Sources`中的顺序其实是在`Woman`之后。这也证明了系统会在子类的`load`方法中自动调用父类的`load`的方法。`load`方法调用时，系统处于脆弱状态，如果调用别的类的方法，且该方法依赖于那个类的`load`方法进行初始化设置，那么必须确保那个类的`load`方法已经调用了。

- 使用场景
由于`load`方法是在类被加载到内存时调用，我们应该尽量减少`load`方法内的逻辑，一方面系统处于脆弱状态而且很不安全，另一方面是`load`方法是线程安全的，它内部使用了锁，所以我们应该避免线程阻塞在`load`方法中。

`load`方法最常见的使用场景是在`load`方法中实现Method Swizzle功能：

下面的示例演示了在`load`放中进行方法交换，以及需要避免在`Woman`类的`load`方法中调用`Worker`类的方法时（`Worker`类的`load`方法还未被调用时）遇到的问题：
```objc
#import "Worker.h"
#import <objc/runtime.h>

@implementation Worker

+ (void)load {
    NSLog(@"%s", __func__);
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(originalMethod));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzledMethod));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)originalMethod {
    NSLog(@"Original Output");
}

- (void)swizzledMethod {
    NSLog(@"Swizzled Output");
}

@end

```

```objc
#import "Woman.h"
#import "Worker.h"

@implementation Woman

+ (void)load {
    NSLog(@"%s", __func__);
    
    Worker *worker = [Worker new];
    [worker originalMethod];
    // 输出的结果为 Original Output，说明worker调用的是原始的`originalMethod`方法，而其交换后的方法未被调用
}

@end
```

```objc
#import <Foundation/Foundation.h>
#import "Worker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Worker *worker = [Worker new];
        [worker originalMethod];
        // 输出的结果为 Swizzled Output，说明worker 调用的方法为`originalMethod`交换后的`swizzledMethod`方法
    }
    return 0;
}

```

在上面的示例中，`Woman`类的`load`方法中，由于还没调用`Worker`的`load`方法，所以输出结果是"Original Output"，而在`main`函数中，输出结果自然就变成了"Swizzled Output"。一般来说，除了Method Swizzle，别的逻辑都不应该放在`load`方法中实现。


### `+initialize`方法
`+initialize`方法是在类或它的子类收到第一条消息之前被调用的，这里所指的消息包括实例方法和类方法的调用，并且只会调用一次。`+initialize`方法实际上是一种惰性调用，也就是说如果一个类一直没被用到，那它的`+initialize`方法也不会被调用，这一点有利于节约资源。
与`+load`方法不同，却更符合我们预期的就是，`+initialize`方法会覆盖。也就是说如果子类实现了`+initialize`方法，就不会执行父类的了，直接执行子类本身的。如果分类实现了`+initialize`方法，也不会再执行宿主类的。所以`+initialize`方法的执行覆盖顺序是：`分类 `-> `子类` ->`宿主类`。且只会有一个`+initialize`方法被执行。

- 下面的示例，我在两个父子类及在这个子类的另外三个分类中分别实现了`+initialize`方法：

```objc
@interface People : NSObject

@end

@implementation People
+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end

@interface Woman : People

@end

@implementation Woman
+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end

@implementation Woman (XYLoad)

+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end

@implementation Woman (XYLoad1)

+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end

@implementation Woman (XYLoad2)

+ (void)initialize {
    NSLog(@"%s", __func__);
}
@end
```

输出结果
```
2019-06-17 13:49:38.228922+0800 Load-and-Initialize[9995:192646] +[People initialize]
2019-06-17 13:49:38.229280+0800 Load-and-Initialize[9995:192646] +[Woman(XYLoad) initialize]
```

从上面的示例可以看出，`initialize`与`load`方法类似的是，`initialize`方法也是系统自动加载的，因此也同样不需要使用`[spur initialize]`方法调用父类的`initialize`方法。与`load`方法不同之处在于，即使子类没有实现`initialize`方法，也会调用父类的方法，这会导致一个很严重的问题：
我们将上面的示例中的`Woman`类及其三个分类的`initialize`方法都注释掉，再次运行示例，打印结果：
```
2019-06-17 13:53:04.723709+0800 Load-and-Initialize[10055:195143] +[People initialize]
2019-06-17 13:53:07.571795+0800 Load-and-Initialize[10055:195143] +[Woman initialize]
```

这是因为在创建子类对象时，首先要创建父类对象，所以会调用一次父类的`initialize`方法，然后创建子类时，尽管自己没有实现`initialize`方法，但还是会调用到父类的方法。虽然`initialize`方法对一个类而言只会调用一次，但这里由于出现了两个类，所以调用两次符合规则，但不符合我们的需求。正确使用 `initialize`方法的姿势如下：
```objc
@implementation People
+ (void)initialize  {
    if (self == [People class]) {
        NSLog(@"%s", __func__);
    }
}
@end
```

加上判断后，就不会因为子类而调用到自己的`initialize`方法了。

- 使用场景
`+initialize`方法主要用来对一些不方便在编译期初始化的对象进行赋值。比如说：无法在编译期设定的全局变量，可以放在`+initialize`方法中初始化。

### 总结
- 1.`+load`和`+initialize`方法都会在实例化对象之前调用，以`main`函数为分水岭，前者在`main`函数之前调用，后者在之后调用。这两个方法会被自动调用，不能手动调用它们。

- 2.`+load`和`+initialize`方法都不用显式的调用父类的方法而是自动调用，即使子类没有`+initialize`方法也会调用父类的方法，而`+load`方法则不会调用父类。

- 3.`+load`方法通常用来进行Method Swizzle，`+initialize`方法一般用于初始化全局变量或静态变量。

- 4.`+load`和`+initialize`方法内部使用了锁，因此它们是线程安全的。实现时要尽可能保持简单，避免阻塞线程，不要再使用锁。
将针对于类修改放在`+intialize`中，将针对Category的修改放在`+load`中。

- 5.`+load`与`+initialize`都应该实现得精简，有助于保持程序的响应能力。

