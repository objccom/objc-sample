### 简介
Swift提供了三种主要的集合类型，即数组、集合和字典，用于存储值集合：

- 1.数组（Arrays）是值的有序集合。
- 2.集合（Sets）是唯一值的无序集合。
- 3.字典（Dictionaries）是键值关联的无序集合。

![CollectionTypes_intro_2x.png](https://static.kuwe.top/2019/6/sGzb2blGLvOyFy9X3jv1a9LNEmTSKufxfAsYDTPEUViqkik61gPwN1Z0CKJqCFL3 "CollectionTypes_intro_2x.png")

Swift中的数组、集合和字典中存储的数据值类型必须明确。这意味着我们不正确地类型的值插入到集合中。它还意味着我们可以确信将从集合中检索的值的类型。

> 注意
swift的数组、集合和字典类型实现为泛型集合。有关泛型类型和集合的详细信息，请参见[泛型](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)。

### 集合的可变性 （Mutability of Collections）
- 1.可变集合，如果创建数组、集合或字典，将其赋值给声明的`var`变量，则创建的集合将是可变的。这意味着我们可以在创建集合之后通过添加、删除或更改集合中的项来更改（或改变）该集合。
- 2.不可变集合，如果将数组、集合或字典赋给`let`常量，则该集合是不可变的，其大小和内容不能更改。

> 注意
在不需要更改集合的所有情况下，最好创建不可变集合。这样做可以更容易地解释代码，并使swift编译器能够优化您创建的集合的性能。

### 数组 （Arrays）
数组是一个有序列表，它的元素存储的是相同类型的值。数组中允许存在相同的值。

>注意
Swift 中的的`Array`类型被桥接到`Foundation`中的`NSArray`类。 更多关于在Foundation和Cocoa中使用Array的信息，参考[ Bridging Between Array and NSArray.](https://developer.apple.com/documentation/swift/array#2846730)

##### 数组类型速记语法 （Array Type Shorthand Syntax）
Swift数组的类型完全写为`Array <Element>`，其中`Element`是允许数组存储的值的类型。 我们还可以以简写形式将数组类型写为`[Element]`。 虽然这两种形式在功能上是相同的，但还是建议优先使用简写形式，并且在引用阵列的类型时在本指南中使用。

```swift
func arrayTypeShorthandSyntax() -> Void {
    
    // 1.数组的第一种写法
    var array1 = Array<Int>()
    array1.append(1)
    
    // 2.数组的第二种写法
    let array2 = [2, 3]
}

##### 创建一个空的数组 （Creating an Empty Array）
我们可以使用初始化语法创建某个类型的空数组：
```
    var array1 = Array<Int>()
    print("array1 is of type [Int] with \(array1.count) items.")
    // 输出结果 array1 is of type [Int] with 0 items.
```

请注意，`array1`变量的类型在初始化时被推断为`[Int]`。

或者，如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空数组，该数组写为[]（一对空方括号）：

```

或者，如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空数组，该数组写为`[]`（一对空方括号）：
```
    array1.append(1)
    // 现在array1 中有一个值为1的Int类型
    
    array1 = []
    // array1被重新赋值，它现在是一个空数组，但仍然是[Int]类型
```
##### 创建有默认值的数组 （Creating an Array with a Default Value）
Swift的`Array`类型还提供了一个初始化方法，用于创建一个特定大小的数组，并将其所有值设置为相同的默认值。 我们将此初始化值传递给适当类型的默认值（称为重复）：以及在新数组中重复该值的次数（称为计数）：
```
    // 创建有默认值的数组
    var threeDoubles = Array(repeating: 0.0, count: 3)
    // threeDoubles的类型为[Double]，等于[0.0,0.0,0.0]
```

##### 通过两个数组相加创建一个数组 (Creating an Array by Adding Two Arrays Together)
我们可以通过使用加法运算符（`+`）将两个具有兼容类型的现有数组相加来创建新数组。 新数组的类型是从我们添加的两个数组的类型推断出来的：
```
    // 4.通过两个数组相加创建一个数组
    var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    // anotherThreeDoubles的类型为[Double]，等于[2.5, 2.5, 2.5]
    
    var sixDoubles = threeDoubles + anotherThreeDoubles
    // sixDoubles 被推断为[Double]，等于[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

##### 用数组字面量构造数组 (Creating an Array with an Array Literal)
我们还可以使用数组文字初始化数组，这是将一个或多个值写为数组集合的简便方法。 数组文字被写为值列表，用逗号分隔，由一对方括号括起来：

```
[value 1, value 2, value 3]
```

下面的示例创建一个名为`shoppingList`的数组来存储`String`值：
```
    // 5.用数组字面量构造数组
    var shoppingList: [String] = ["Eggs", "Milk"]
    // shoppingList 被初始化为具有两个元素的[String]数组
```

`shoppingList`变量声明为“字符串值数组”，写为`[String]`。 由于此特定数组已指定`String`类型的值，因此仅允许存储String值。 这里，`shoppingList`数组初始化为两个`String`值（“Eggs”和“Milk”），写在数组文字中。

> 注意
`shoppingList`数组被声明为变量（使用`var` 声明）而不是常量（使用`let` 声明），因为在下面的示例中，更多项目被添加到这个数组中，所有它需要时可变的。

在这种情况下，数组文字包含两个`String`值，而不包含任何其他值。 这匹配`shoppingList`变量的声明类型（一个只能包含`String`值的数组），因此允许使用数组文字的赋值作为初始化带有两个初始项的`shoppingList`的方法。

感谢Swift的类型推断，如果要使用包含相同类型值的数组文字对其进行初始化，则不必编写数组类型。` shoppingList`的初始化可以用更短的形式编写：
```
var shoppingList = ["Eggs", "Milk"]
```

因为数组文字中的所有值都是相同的类型，所以Swift可以推断`[String]`是用于`shoppingList`变量的正确类型。

##### 访问和修改数组 （Accessing and Modifying an Array）
我们可以通过数组的方法和属性或使用下标语法来访问和修改数组。

通过`Array`的`count`只读属性，获取数组元素的个数。
```
    var shoppingList: [String] = ["Eggs", "Milk"]
    
    // 获取数组元素的个数
    print("shoppingList 这个数组包含 \(shoppingList.count) 个元素.")
    // 打印结果 shoppingList 这个数组包含 2 个元素.
```

使用返回值为`Boolean `的`isEmpty`属性作为检查一个数组的`count`属性是否等于`0`的快捷方式：
```
    if shoppingList.isEmpty {
        print("shoppingList 为空")
    }
    else {
        print("shoppingList 不为空")
    }
    // 打印结果 shoppingList 为空
```

我们可以调用数组的`append(_:) `方法，向数组的末尾添加一个元素：
```
    shoppingList.append("Flour")
    // shoppingList 现在包含三个元素，最后一个元素为Flour
```

使用`+=`运算符，向数组的末尾追加一个相同类型的数组
```
    shoppingList += ["Baking Powder"]
    // shoppingList 数组中现在包含4个元素
    
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    // shoppingList 数组中现在包含7个元素
```

使用下标语法从数组中检索值，在数组名称后面的方括号内传递要检索的值的索引：
```
    var firstItem = shoppingList[0]
    // firstItem 的值为 Eggs
```

> 注意
数组中的第一项索引为`0`，而不是`1`. Swift中的数组始终为零索引。

使用下标语法时，必须要防止下标越界。 例如，`shoppingList[shoppingList.count] =“Salt”`数组越界操作，会发送运行时错误。

使用下标修改某个数组中某个范围的值：
我们还可以使用下标语法一次更改数组某个范围的值，即使替换值集的长度与要替换的范围不同。 以下示例将“Chocolate Spread”，“Cheese”和“Butter”替换为“Bananas”和“Apples”：
```
    shoppingList[4...6] = ["Bananas", "Apples"]
    // 现在数组中包含6个元素
    print(shoppingList)
```

要在数组的指定索引处插入有效的值，请调用数组的`insert(_：at :)`方法：
```
    shoppingList.insert("Maple Syrup", at: 0)
    // 现在数组中包含7个元素，首个元素为Maple Syrup
```
调用insert(_:at:)方法把值为"Maple Syrup"的新数据项插入列表的最开始位置，并且使用0作为索引值。

根据索引删除数组中的元素。
同样，我们使用`remove(at :)`方法从数组中删除项目。 此方法删除指定索引处的元素，并返回已删除的元素（如果我们不需要这个返回值，可以忽略它）：
```
    let removedItem = shoppingList.remove(at: 0)
    // 从数组中的第0个元素被移除掉
    print("移除的元素为 \(removedItem)")
    // 移除的元素为 Maple Syrup
```

> 注意
如果尝试访问或修改数组以外的索引，则会触发运行时错误。我们可以在使用之前，可以使用索引与`count`属性比较，以检查这个索引是否越界。 因为数组从零开始索引，所以数组中最大的有效索引是`count-1`，  但是，当count为0（表示数组为空）时，没有有效的索引。

删除项目时，数组中的任何间隙都会关闭，因此索引0处的值再次等于“Six eggs”：
```
    firstItem = shoppingList[0]
    print("firstItem 是 \(firstItem)")
    // 打印结果 firstItem 是 Six eggs
```

删除数组中末尾的元素：
我们可以使用`removeLast()`方法，从数组中删除最后一个元素，最好不要使用`remove(at :)`方法，以避免需要查询数组的count属性。 `remove(at :)`和`removeLast()`方法一样，返回值都是已删除的元素：
```
    removedItem = shoppingList.removeLast()
    // 数组中最后一个元素被删除了，现在只有5个元素
    print("removedItem 是 \(removedItem)")
    // 打印结果 removedItem 是 Apples
```

##### 迭代数组
- 1.使用`for-in`循环遍历数组中的所有元素：

```
    var shoppingList = ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]
    for item in shoppingList {
        print("item == \(item)")
    }
    /*
     输出结果
     item == Six eggs
     item == Milk
     item == Flour
     item == Baking Powder
     item == Bananas
     */
```

- 2.使用`enumerated()`方法迭代数组
如果迭代数组时，需要同时使用元素的索引和值，请使用`enumerated()`方法迭代数组。 对于数组中的每个元素，`enumerated()`方法返回由整数和元素组成的元组。 我们可以将元组分解为临时常量或变量，作为迭代的一部分：
```
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index): \(value)")
    }
    /*
     输出结果
     Item 0: Six eggs
     Item 1: Milk
     Item 2: Flour
     Item 3: Baking Powder
     Item 4: Bananas
     */
```

有关for-in循环的更多信息，请参阅[For-In循环](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID121)。

##### 集合 （Sets）
集合的特点是存储相同类型的不相同值，且它是顺序。 当元素的顺序不重要时，或者当我们需要确保元素仅出现一次时，就可以使用集合而不是数组。

> 注意
Swift的`Set`类型桥接到`Foundation`的`NSSet`类。
有关使用Set with Foundation和Cocoa的更多信息，请参阅[Set和NSSet之间的桥接](https://developer.apple.com/documentation/swift/set#2845530)。

##### 集合类型的哈希值 （Hash Values for Set Types）
