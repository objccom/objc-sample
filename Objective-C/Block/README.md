Block在开发中常用的，要想解决Block在开发中遇到的问题，我们需要了解Block的本质、截获变量的特性、`__block`修饰符、`block`的内存管理和循环引用问题。通过`clang`编译器深度剖析`block`底层实现。

为了便于理解使用了较多白话，[查看demo](https://github.com/objccom/objc-sample/tree/master/Objective-C/Block)

### 通过`clang`编译器剖析`block`

- 执行编译
我们主要对`XYBlock.m`中`-method`方法中的`block`进行剖析
以下为`-method`方法实现：
```Objective-C
@implementation XYBlock

- (void)method {
    int multiplier = 6;
    int (^block)(int) = ^int(int num){
        return num * multiplier;
    };
    
    multiplier = 4;
    NSLog(@"result is %d", block(2));
}

@end
```

通过`clang`编译器生成`cpp`实现。
```
clang -rewrite-objc XYBlock.m 
```
执行完成后，在当前目录下生成同名的`.cpp`文件

在`XYBlock.cpp`中，我们找到编译后`_I_XYBlock_method`函数就是`XYBlock`类中`-method`的方法：
```c++
static void _I_XYBlock_method(XYBlock * self, SEL _cmd) {
    int multiplier = 6;
    int (*block)(int) = ((int (*)(int))&__XYBlock__method_block_impl_0((void *)__XYBlock__method_block_func_0, &__XYBlock__method_block_desc_0_DATA, multiplier));

    multiplier = 4;
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_9n_2_q48v8j049bnt5m4k7c_4rh0000gq_T_XYBlock_69f118_mi_0, ((int (*)(__block_impl *, int))((__block_impl *)block)->FuncPtr)((__block_impl *)block, 2));
}
```

- 编译后结果剖析

`-method`方法没有参数的，所以`_I_XYBlock_method`函数的两个参数为`objcetive-c`方法的默认隐士参数（self 和 _cmd选择器）。

`_I_XYBlock_method`函数内：
第一行代码`int multiplier = 6;`与`XYBlock`中的`-method`方法的第一行保持一致。
第二行代码`int (*block)(int) = ((int (*)(int))&__XYBlock__method_block_impl_0((void *)__XYBlock__method_block_func_0, &__XYBlock__method_block_desc_0_DATA, &multiplier));`为`block`编译后的结果，`__XYBlock__method_block_impl_0`是一个结构体，其中第一个参数`__XYBlock__method_block_func_0`是一个`void *`类型的函数指针，第二个参数为block的描述，第三个参数为传入block的变量`multiplier`
第三行代码主要为block`的调用



### 编译后block的结构体 `__XYBlock__method_block_impl_0` 
为了了解block的本质，这里需要先了解`XYBlock`中`-method`方法中的定义的`block`被`clang`编译后的 `__XYBlock__method_block_impl_0`这个结构体。

```c++
struct __XYBlock__method_block_impl_0 {
  struct __block_impl impl; // __block_impl 类型的结构体
  struct __XYBlock__method_block_desc_0* Desc; // block的描述
  int multiplier; // block 中使用外部的变量，由于block使用的`multiplier`变量为局部变量基本数据类型的变量，所以截获的是其值
  /// 构造函数
  /// @param fp void * 类型的函数指针
  /// @param desc block的描述
  /// @param _multiplier block中使用外部的变量 _multiplier 对应`XYBlock`中`-method`方法中的`int multiplier = 6;`
  /// @param flags 标记
  __XYBlock__method_block_impl_0(void *fp, struct __XYBlock__method_block_desc_0 *desc, int _multiplier, int flags=0) : multiplier(_multiplier) {
    impl.isa = &_NSConcreteStackBlock; // block 的类型
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
```
先看下这个结构体的成员变量：

- 1. `struct __block_impl impl;`
- 2. `struct __XYBlock__method_block_desc_0* Desc;`
- 3.  `int multiplier;`
- 4.  `__XYBlock__method_block_impl_0(...): multiplier(_multiplier) ` 构造函数，该构造函数后面通过`multiplier(_multiplier)`将参数`_multiplier`赋值给了成员变量`multiplier`。该构造函数内初始化了`__block_impl`结构体，并将函数指针赋值给了该结构体的成员变量`FuncPtr`。

### `__block_impl`结构体
- 声明
在`XYBlock.cpp`中找到`__block_impl`结构体的定义
```c++
struct __block_impl {
  void *isa; // isa 指针，通过这个isa 指针，由于`objc_class`和`objc_object`都具备这一特性，可以把Block理解是一个对象
  int Flags; // 标记
  int Reserved; 
  void *FuncPtr; // 是一个无类型的函数指针，在定义block的`{}`中的定义的执行体，最终就会产生这样一个函数，`block`通过一个指针指向这样的实现
};
```

### `block`的`{}`定义的执行体
以下为编译后产生的函数体实现
```
/// 根据定义的block生成的函数体实现
/// @param num 定义block时的参数
static int __XYBlock__method_block_func_0(struct __XYBlock__method_block_impl_0 *__cself, int num) {
  int multiplier = __cself->multiplier; // block使用的外部变量`multiplier`为局部变量基本数据类型的变量，所以这里可以看到block将使用的外部变量的值copy到函数体内
  // block的 {} 内执行的代码
  return num * multiplier;
}

```

### 什么是`Block`
`Block`是一个对象，这个对象封装了函数以及函数执行的上下文。

### 什么是`Block`的调用
`Block`的调用就是函数的调用的本质
要想了解为什么`Block`的调用就是函数的调用这个问题，我们需要到`XYBlock.cpp`（clang编译`XYBlock.m`的结果）文件中，并找到`static void _I_XYBlock_method(XYBlock * self, SEL _cmd)`这个函数的实现，上面我们以及介绍过这个函数，它是对`XYBlock.m`的`-method`方法编译后的实现：
```c++
static void _I_XYBlock_method(XYBlock * self, SEL _cmd) {
    int multiplier = 6;
    int (*block)(int) = ((int (*)(int))&__XYBlock__method_block_impl_0((void *)__XYBlock__method_block_func_0, &__XYBlock__method_block_desc_0_DATA, multiplier));

    multiplier = 4;
    // 调用block，实际上就是函数调用
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_9n_2_q48v8j049bnt5m4k7c_4rh0000gq_T_XYBlock_69f118_mi_0, ((int (*)(__block_impl *, int))((__block_impl *)block)->FuncPtr)((__block_impl *)block, 2));
}
```
下面的函数实现是通过执行`__block_impl`结构体中`FuncPtr`函数指针执行block
`((int (*)(__block_impl *, int))((__block_impl *)block)->FuncPtr)((__block_impl *)block, 2)`
首先进行强制类型转换，然后在执行`FuncPtr`时，传入了两个参数，一个是`block`本身，另一个是`2`，实际上执行的`__XYBlock__method_block_func_0`函数。

### `Block`截获变量特性
要想了解`Block`截获变量的特性，我们先从一道笔试题开始着手：
```objective-c
    int multiplier = 6;
    int (^block)(int) = ^int(int num){
        return num * multiplier;
    };
    
    multiplier = 4;
    NSLog(@"result is %d", block(2));
```
答案：result is 12

当然要知道这道题为什么是`12`，我们需要了解`Block`截获变量的类型，哈哈。
##### `Block`对以下类型的变量截获是不一样的。
关于block的截获特性你是否了解
- 局部变量
    * 基本数据类型
    * 对象数据类型
- 静态局部变量
- 全局变量
- 静态全局变量

##### 针对不同变量类型，`Block`是如何截获的
- 对于基本数据类型的局部变量，截获其值
- 对于对象类型的局部变量，连同所有权修饰符一起截获
-  静态局部变量以指针形式截获
- 全局变量和静态全局变量，`Block`不对其进行截获

如果要理解什么是所有权一起截获或者其他截获的原理，需要查看使用`clang`编译block后的c++文件。


##### 截获变量的源码解析
为了验证以上类型的变量截获区别，并了解不同变量类型`block`是如何截获的，我们使用`clang -rewrite-objc -fobjc-arc xxx.m`编译block的c++实现，将xxx.m替换后为需要编译的`.m`文件。比之前用的命令多了`-fobjc-arc`参数

我们创建`XYBlock1`，并在其`-method`方法的block中使用以上类型的变量，以验证block对变量的截获。
```objective-c
@implementation XYBlock1

// 全局变量
int global_var = 4;
// 静态全局变量
static int static_global_var = 5;

- (void)method
{
    // 基本数据类型的变量
    int var = 1;
    // 对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    // 静态局部变量
    static int static_var = 3;
    void (^ block)(void) = ^{
        NSLog(@"局部变量<基本数据类型> var is %d", var);
        NSLog(@"局部变量<__unsafe_unretained 对象类型> unsafe_obj is %@", unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> strong_obj is %@", strong_obj);
        NSLog(@"静态局部变量 static_var is %d", static_var);
        NSLog(@"全局变量 global_var is %d", global_var);
        NSLog(@"静态全局变量 static_global_var is %d", static_global_var);
    };
    
    block();
}
@end

```

- 使用`clang`将`XYBlock.m`编译为c++实现
```
clang -rewrite-objc -fobjc-arc XYBlock1.m
```
执行完成后，会生成`XYBlock1.cpp`文件。

查看经过编译之后block对应的结构体：

```c++

// 全局变量不会被截获
int global_var = 4;
// 全局静态变量不会被截获
static int static_global_var = 5;

struct __XYBlock1__method_block_impl_0 {
  struct __block_impl impl;
  struct __XYBlock1__method_block_desc_0* Desc;
  // var 是截获局部变量的值
  int var;
  // unsafe_obj 是连同所有权修饰符一起截获
  __unsafe_unretained id unsafe_obj;
  __strong id strong_obj;
  // static_var 是局部静态变量，截获其指针
  int *static_var;
  __XYBlock1__method_block_impl_0(void *fp, struct __XYBlock1__method_block_desc_0 *desc, int _var, __unsafe_unretained id _unsafe_obj, __strong id _strong_obj, int *_static_var, int flags=0) : var(_var), unsafe_obj(_unsafe_obj), strong_obj(_strong_obj), static_var(_static_var) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
```

通过以上可以结构体，看到在`XYBlock1.m`的`-method`方法中，block中的使用的外部变量是通过`__XYBlock1__method_block_impl_0`结构体的构造函数的参数传递给这个block的结构体。
`XYBlock1.m`中的变量是以什么样的形式被block捕获的：
- 局部基本数据类型的变量`var`的值被赋值给`__XYBlock1__method_block_impl_0`这个block结构体的`int var;`变量，就是简单的赋值操作。
- 局部对象类型的`_unsafe_obj`和`_strong_obj`本身也是指针，且block结构体中定义的这两个变量与我们在`-method`方法中定义的变量类型是一样的（分别都是`__unsafe_unretained id`和`__strong id`）， 所有是连同所有权修饰符一起截获。
- 局部静态变量`static_var`是将其地址传递给`int *static_var;`指针变量，将来操作或使用的也是其指针指向内存的值。
- 全局变量和静态全局变量，在`struct __XYBlock1__method_block_impl_0 {...)`结构体的外部而非此结构体的内部，所以并未对其进行捕获哦。


当我们理解以上的变量类型在block中捕获以后，就会对`Block`产生循环引用有更好的理解。


### `__block`修饰符
当被截获的变量在block内赋值时，需要使用`__block`修饰符。

问题：下面两段代码，分别定义了`array`变量，并在block中操作`array`变量，哪段需要`__block`修饰`array`变量呢？
- 第一段
```objcetive-c
    {
        NSMutableArray *array = [NSMutableArray array];
        void (^block)(void) = ^{
            [array addObject:@123];
        };
        block();
    }
```

- 第二段
```objective-c
    {
        NSMutableArray *array = nil;
        void (^block)(void) = ^{
            array = [NSMutableArray array];
        };
        block();
    }
```
答案：第一段在block内对`array`变量的操作只是使用而非赋值，所以不需要`__block`修饰。而第二段在block内对`array`变量进行了赋值操作，所以需要使用`__block`修饰符，不然编译阶段无法通过。


##### 变量赋值时，`__block`的特点
- 需要使用`__block`修饰符的变量
    * 局部变量
        * 基本数据类型
        * 对象类型
- 不需要使用`__block`修饰符的变量
    * 静态局部变量
    * 静态全局变量
    * 全局变量

这与block截获变量的特性有关，上面我们已经介绍了各种类型变量在block内截获的区别。
- `静态局部变量`是以指针的形式被block截获的，所以在block内操作静态变量就等于操作外部的变量，所以不需要`__block`.
- `静态全局变量`和`全局变量`不涉及block截获，我们是直接对其使用的，所以需要使用`__block`。


##### `__block`的作用、机制、原理
创建`XYBlock2`类，并在`-method`方法中实现以下`__block`的例子：
```objective-c
@implementation XYBlock2
- (void)method {
    __block int multiplier = 6;
    int (^block)(int) = ^int(int num){
        return num * multiplier;
    };
    
    multiplier = 4;
    NSLog(@"result is %d", block(2));
}
@end
```
上面的`_method`方法中，在block中对外部变量`multiplier`和其内部变量`num`执行乘法操作，而`multiplier`是`__block`修饰的整型变量。

输出结果：result is 8
上面的代码块中使用`__block`修饰了`multiplier`变量，输出的结果为8，如果不使用`__block`修饰则输出12。这是为什么呢？
这是因为`__block`修饰的整型变量变成了对象。

我们可以通过`clang`指令查看`__block`修饰的变量在block结构体中发生了什么，以及它的作用。

- 使用`clang`将`XYBlock2.m`编译为c++实现进行验证
```
clang -rewrite-objc -fobjc-arc XYBlock2.m 
```

在编译完成后`XYBlock2.cpp`文件中，找到原`-method`方法编译后的函数实现`_I_XYBlock2_method()`:
```c++
static void _I_XYBlock2_method(XYBlock2 * self, SEL _cmd) {
    // __block int multiplier = 6; 使用__block修饰的整型变量使用clang编译后变成了__Block_byref_multiplier_0类型的结构体
    __attribute__((__blocks__(byref))) __Block_byref_multiplier_0 multiplier = {(void*)0,(__Block_byref_multiplier_0 *)&multiplier, 0, sizeof(__Block_byref_multiplier_0), 6};
    int (*block)(int) = ((int (*)(int))&__XYBlock2__method_block_impl_0((void *)__XYBlock2__method_block_func_0, &__XYBlock2__method_block_desc_0_DATA, (__Block_byref_multiplier_0 *)&multiplier, 570425344));

    (multiplier.__forwarding->multiplier) = 4;
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_9n_2_q48v8j049bnt5m4k7c_4rh0000gq_T_XYBlock2_620611_mi_0, ((int (*)(__block_impl *, int))((__block_impl *)block)->FuncPtr)((__block_impl *)block, 2));
}
```
从`_I_XYBlock2_method()`函数内第一行代码可以得知, 使用`__block`修饰的`multiplier`整型变量使用clang编译后变成了`__Block_byref_multiplier_0`类型的结构体。
第二行代码就是`multiplier = 4;`编译后的代码，最终变成了`(multiplier.__forwarding->multiplier) = 4;`，就是找到`multiplier`对象的`__forwarding`，并对其`multiplier`成员变量赋值为4。

- `__block`被clang编译后的 `__Block_byref_multiplier_0`结构体
我们找到`__Block_byref_multiplier_0`的声明
```c++
struct __Block_byref_multiplier_0 {
  void *__isa;
__Block_byref_multiplier_0 *__forwarding; // 指向同类型的指针
 int __flags;
 int __size;
 int multiplier; // block 外部使用`__block`的变量
};
```
可以看到`__Block_byref_multiplier_0`结构体内部有一个`isa`指针，由于`objc_object`和`objc_class`结构体内都具备这一特性，所以我认为被`__block`修饰的变量不管是基本数据类型还是对象，它都是一个对象。

- 怎么给`__block`修饰的变量赋值
当我们对`__block`修饰的变量进行赋值操作时，会在block结构体中执行`(multiplier.__forwarding->multiplier) = 4;`
也就是说修改`-method`中`multiplier`变量，实际上是对clang编译后的`multiplier`这个对象的`__forwarding`的`multiplier`进行赋值。

我们找到clang编译后的block结构体`__XYBlock2__method_block_impl_0`:
```c++
struct __XYBlock2__method_block_impl_0 {
  struct __block_impl impl;
  struct __XYBlock2__method_block_desc_0* Desc;
  __Block_byref_multiplier_0 *multiplier; // by ref
  __XYBlock2__method_block_impl_0(void *fp, struct __XYBlock2__method_block_desc_0 *desc, __Block_byref_multiplier_0 *_multiplier, int flags=0) : multiplier(_multiplier->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
```
通过`__XYBlock2__method_block_impl_0`结构体的构造函数可以说明，`multiplier(_multiplier->__forwarding) `将`_multiplier->__forwarding`赋值给了该结构体的`multiplier`结构体变量:
```
__Block_byref_multiplier_0 *_multiplier, int flags=0) : multiplier(_multiplier->__forwarding) {}
```

##### 当`block`在栈上时，`__block`结构体中的`__forwarding`指向`__block`结构体自己
当我们给`multiplier`赋值时，实际上是对`__block`结构体中的`__forwarding`指针，实际上还是这个`__block`结构体本身，所有还是对这个`__block`结构体的`multiplier`成员进行赋值。
##### 当`block`在堆上时，`__block`结构体中的`__forwarding`指向其他地方。
这个问题在下面的【栈上`__block`的copy操作】中会讲到。

- `__forwarding`是用来做什么的
在栈上的`__block`的`__forwarding`指向它自己，即使没有这个变量我们也可以直接对`multiplier`进行赋值， 那`__block`结构体的`__forwarding`指针岂不是多余了。

### `Block`内存管理

- block都有哪几种类型
我们在clang编译后block结构体中，可以看到`impl.isa = &_NSConcreteStackBlock;`这一句代码中的`isa`指针就是标记block是哪种类型的。

block有三种类型：`_NSConcreteStackBlock`、`_NSConcreteGlobalBlock`、`_NSConcreteMallocBlock`。

- block在内存中是怎么被分配的

| 内存分区 | 
| :------: | 
| 内核区 |
| 栈区（stack） | `_NSConcreteStackBlock`在栈上 | 
| 堆区（heap） | `_NSConcreteMallocBlock`放在堆区 |
| 未初始化数据区（.bss） |
| 已初始化数据区（.data） | `_NSConcreteGlobalBlock`放在已初始化代码区。 |
| 代码段（.txt） |
| 保留 |


- block 的copy操作

| Block类别 | 源 | Copy结果 | 
| :------: | :------: | :------: | 
| `_NSConcreteStackBlock` | 栈区 | 堆区 |
| `_NSConcreteMallocBlock` | 堆区 | 增加引用计数 | 
| `_NSConcreteGlobalBlock` | 数据区 | 什么都不做 |


- 栈上block的销毁
假如在栈区有一个`__block`变量，并且有一个block，在变量作用域结束后`block`和`__block`变量都会被销毁。

- 栈上block的copy
假如在栈上有一个block，并且block中使用了`__block`变量（block内需要对外部局部变量进行赋值操作时使用`__block`），当对此block进行copy操作时，会在堆区产生一个与栈区一模一样的block和`__block`变量，但是它们是分在两块内存空间中，随着变量作用域的结束栈区block和`__block`变量会被销毁。但是堆区的block和`__block`变量仍然存在。

由此就产生一个问题：在`MRC`环境下当我们对栈上的block进行copy操作之后是否会引起内存泄露？
答案是肯定的，这与我们手动通过`alloc`方法创建一个对象，没有调用`release`的效果是一样的。

- 栈上`__block`的copy操作
假如在栈上有一个block，并且有`__block`变量，这个`__block`有一个`__forwarding`指针，当block在栈区时，`__forwarding`指针指向`__block`对象本身。当对栈区的block进行copy之后，在堆区会产生一个完全一致的block和`__block`变量。此时栈上的`__block`结构体中的`__forwarding`指针指向堆区的`__block`的`__forwarding`，而堆区的`__forwarding`指针指向`__block`本身。
当我们对`multiplier`这样一个`__block`修饰的整型变量修改时，转换出来的都是同一行代码
```
(multiplier.__forwarding->multiplier) = 4;
```
当我们对栈上的block已经做完copy操作后，实际上我们修改的不是栈上`__block`变量的值，而是通过栈上`__block`结构体里面的`__forwarding`指针找到堆上的`__block`变量，然后对堆上的`multiplier`进行赋值比如4。
那么同样的，如果`__block`变量由于被成员变量block所持有的话，当我们在另一个方法或者其他的地方调用这个`__block`的修改的情况下，那实际上是通过自身的`__forwarding`指针来进行修改的。
经过编译器的编译，`(multiplier.__forwarding->multiplier) = 4;`代码不管是出现在栈上还是堆区的调用，实际上都是针对堆上的`__block`进行修改的。

如果我们没有对栈上的block进行copy操作，`(multiplier.__forwarding->multiplier) = 4;`修改的就是栈上block的`__block`变量


### `__forwarding`的总结

- 先看一道百度的笔试题，这道题实际上是考验我们对`__forwarding`的理解：

```objective-c
@interface XYBlock3 ()

@property (nonatomic, copy) int(^blk)(int num);

@end

@implementation XYBlock3

- (void)method {

    __block int multipliter = 10;
    _blk = ^int(int num) {
        return num * multipliter;
    };
    
    multipliter = 6;
    [self executeBlock];
}

- (void)executeBlock {
    // 这是百度的笔试的真题，这道题实际上是考验我们对`__forwarding`的理解
    int result = _blk(4);
    NSLog(@"result is %d", result);
    // 输出结果 result is 24
}

@end

```

输出结果 result is 24
`-method`方法中的代码分析：
第一行代码`__block int multipliter = 10;`初始化了`multipliter`是一个`__block`修饰的局部变量，那么实际上在clang编译后，他就变成了对象。所以实际上`multipliter = 6;`对`multipliter`的赋值不是对这个局部变量的赋值，而是通过`multipliter`的`__forwarding`指针，然后对其成员变量`multipliter`进行赋值。
第二行代码创建一个block并赋值给`_blk`，`_blk`是`XYBlock3`对象的成员变量，并且属性修饰符为copy，当对他进行赋值操作时，实际上会对其进行copy，那么`_blk`这个block就会在堆区有另一份副本。
第三行代码`multipliter = 6;`代表的含义就是通过栈上的`multipliter`的`__forwarding`指针找到堆上的所对应的`__block`变量，然后对堆上的`__block`结构体的`multiplier`属性进行赋值比如6。

在`-executeBlock`方法中执行`_blk(4)`并传入参数为4，在block代码块内执行了`num * multipliter;`，实际上这里使用的`multipliter`变量是堆上的`__block`变量，所以之后block之后是4乘以6的，结果就是24。


- `__forwarding`存在的意义
无论block在内存的哪个区域，都可以顺利的访问同一个`__block`的变量。


#### Block循环引用的问题

- 先看示例，看下下面的代码有什么问题
```objective-c
@interface XYBlock4 ()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, copy) NSString *(^strBlock)(NSString *num);

@end

@implementation XYBlock4

- (void)method {
    _array = [NSMutableArray arrayWithObject:@"block"];
    
    _strBlock = ^NSString *(NSString *num) {
        // 在此block内使用成员变量`_array`，会产生警告： Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
        return [NSString stringWithFormat:@"helloOC_%@", _array[0]];
    };
    _strBlock(@"hello");
}

@end

```

分析以上代码产生循环引用的原因：
以上代码中，`XYBlock4`类有两个成员变量`strong`特性的`array`和`copy`特性的`strBlock`，此时`XYBlock4`对象持有了`array`变量和`strBlock`变量，而在`strBlock`的block代码块中又持有了`XYBlock4`对象的`array`成员变量。
这样会产生循环引用，并且是自循环形式的循环引用，由于`XYBlock4`是通过copy关键字声明的`strBlock`成员，所以当前对象对这个block是强引用的，而block的表达式中又使用了当前对象的`array`成员变量，那么通过block截获变量的特性，关于block中使用对象类型的局部变量或成员变量，会连同其所有权及关键字一同截获，而`array`属性在当前对象中是使用`strong`修饰的，所以在block的结构体中有一个strong类型的指针指向原来的对象或当前对象，由此就产生了一个循环引用。


- 如何解决循环引用
使用`__weak`修饰符创建一个弱引用的变量并将`_array`赋值给它，在block表达式内使用这个`__weak`修饰的变量，即可打破自循环引用
```objective
@interface XYBlock4 ()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, copy) NSString *(^strBlock)(NSString *num);

@end

@implementation XYBlock4

- (void)method {
    _array = [NSMutableArray arrayWithObject:@"block"];
    
    // 解决循环引用
    __weak NSMutableArray *weakArray = _array;
    _strBlock = ^NSString *(NSString *num) {
        // 在此block内使用成员变量`_array`，会产生警告： Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
        return [NSString stringWithFormat:@"helloOC_%@", weakArray[0]];
    };
    _strBlock(@"hello");
}

@end
```

为什么通过`__weak`修饰对于的成员变量就可以达到避免循环引用的目的呢？
这个答案实际在讲block截获变量的特性时就给出了答案，由于block对截获的变量，如果这个变量是对象类型的，连同其所有权修饰符一起截获，当我们在block使用的外部变量是`__weak`修饰符的，那么在block当中所 产生的结构体中的变量也是`__weak`修饰的。


### `__block`引发的循环引用

先看示例，看看以下代码有什么问题：
```objective-c
@interface XYBlock5 ()

@property (nonatomic, assign) int var;
@property (nonatomic, copy) int (^ blk)(int num);

@end

@implementation XYBlock5

- (void)method {
    __block XYBlock5 *blockSelf = self;
    _blk = ^int (int num) {
        return num * blockSelf.var;
    };
    _blk(3);
}

@end
```

- 在MRC环境下，以上代码不会产生循环引用，没有任何问题。
- 在ARC下，会产生循环引用，引发内存泄露。
由于原对象持有了block，block持有了`__block`变量，而`__block`又持有了原对象，导致大环引用，在ARC下可以采用断环的形式，解决这种循环引用，断开`__block`变量对原对象的持有，就可以规避循环引用。

解决方案：
在block表达式内部加入`blockSelf = nil;`的赋值操作，就可以规避循环引用，也就是说当我们调用`_blk`之后就会断开这个环，然后就可以得到内存的释放和销毁，这种解决方案有一个弊端，如果这个block未被调用时，这个环就一直存在，导致无法释放该对象。
```objective-c
@interface XYBlock5 ()

@property (nonatomic, assign) int var;
@property (nonatomic, copy) int (^ blk)(int num);

@end

@implementation XYBlock5

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)method {
    __block XYBlock5 *blockSelf = self;
    _blk = ^int (int num) {
        
        int ret = num * blockSelf.var;
        // 在block表达式内部加入`blockSelf = nil;`的赋值操作，就可以规避循环引用
        blockSelf = nil;
        return ret;
    };
    _blk(3);
}

@end
```
