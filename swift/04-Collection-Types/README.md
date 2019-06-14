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
一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是`Int`类型的，相等的对象哈希值必须相同，比如`a==b`,因此必须`a.hashValue == b.hashValue`。

Swift 的所有基本类型(比如`String`，`Int`，`Double`和`Bool`)默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。没有关联值的枚举成员值(在[Enumerations ](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)有讲述)默认也是可哈希化的。

> 注意：
我们可以使用自定义的类型作为集合的值的类型或者是字典的键的类型，但这些自定义类型必须符合 Swift 标准库中的`Hashable`协议。符合`Hashable`协议的类型需要提供一个类型为`Int`的可读属性`hashValue`。由类型的`hashValue`属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。
因为`Hashable`协议符合`Equatable`协议，所以遵循该协议的类型也必须提供一个"是否相等"运算符(`==`)的实现。这个`Equatable`协议要求任何符合`==`实现的实例间都是一种相等的关系。也就是说，对于a,b,c三个值来说，`==`的实现必须满足下面三种情况：

- `a == a`(自反性)
- `a == b`意味着`b == a`(对称性)
- `a == b && b == c`意味着`a == c`(传递性)

关于遵循协议的更多信息，请看[协议](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)。

##### 集合类型语法 （Set Type Syntax）
Swift集的类型写为`Set <Element>`，其中`Element`是允许集存储的类型。 与数组不同，集合没有等效的简写形式。

##### 初始化和创建集合 （Creating and Initializing an Empty Set）
我们可以通过构造器语法创建一个特定类型的空集合：

- 1.通过构造器语法创建一个特定类型的空集合：

```
    // 创建一个字符集合
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    // 输出 letters is of type Set<Character> with 0 items.
```

> 注意：
通过构造器，这里的letters变量的类型被推断为`Set<Character>`。

- 2.向集合中添加元素：
或者，如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空的`Set`：
```
    letters.insert("a")
    // letters 现在含有1个 Character 类型的值
    letters = []
    // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型
```

##### 用数组字面量创建集合（Creating a Set with an Array Literal）
我们还可以使用字符数组初始化集合，作为将一个或多个值写为集合的简写方式。

- 1.创建一个名为`favoriteGenres`的`Set`来存储`String`值：
```
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // favoriteGenres 现在被初始化为包含三个字符串元素的集合
```

这个`favoriteGenres`变量被声明为“`String`值的集合”，写为`Set<String>`。由于这个特定的集合含有指定`String`类型的值，所以它只允许存储`String`类型值。这里的`favoriteGenres`变量有三个`String`类型的初始值("Rock"，"Classical"和"Hip hop")，并以数组字面量的方式出现。

> 注意：
`favoriteGenres`被声明为一个变量(拥有`var`标示符)而不是一个常量(拥有`let`标示符),因为它里面的元素将会在下面的例子中被增加或者移除。

一个`Set`类型不能从数组字面量中被单独推断出来，因此`Set`类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么你无须写出Set的具体类型。`favoriteGenres`的构造形式可以采用简化的方式代替：
```
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
```

由于数组字面量中的所有元素类型相同，Swift 可以推断出`Set<String>`作为`favoriteGenres`变量的正确类型。

##### 访问和修改集合的元素（Accessing and Modifying a Set）
我们可以通过其方法和属性访问和修改集合。

- 1.使用只读的`count `属性获取集合的元素个数。

```
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    print("favoriteGenres 的元素个数：\(favoriteGenres.count)")
    // 输出 favoriteGenres 的元素个数：3
```

- 2.判断集合是否为空，使用`Bool`类型的`isEmpty`属性作为检查`count`属性是否等于0的快捷方式：

```
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    // 输出 "I have particular music preferences."
```

- 3.添加元素到集合中，调用`Set`的`insert(_ :)`方法将新元素添加到集合中：

```
    favoriteGenres.insert("Jazz")
    // favoriteGenres 中现在包含4个元素
```

- 4.移除集合中的元素，通过调用`Set`的`remove(_ :)`方法从集合中删除项目，如果该项目是该集合的成员，则删除该项目，并返回已删除的值，如果该集合不包含该项目，则返回`nil`。 或者，可以使用`removeAll()`方法删除集合中的所有元素。

```
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    // 输出 "Rock? I'm over it."
```

- 5.检查集合中是否包含某个元素，使用`contains(_ :)`方法。

```
    // 5.检查集合中是否包含某个元素，使用`contains(_ :)`方法。
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
    // 输出 "It's too funky in here."
```


##### 集合的迭代（Iterating Over a Set）
使用`for-in`循环遍历一个`Set`中的所有元素。

- 1.使用for-in循环遍历集合中所有元素
```
    let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // 1.使用for-in循环遍历集合中所有元素
    for genre in favoriteGenres {
        print("\(genre)")
    }
    // Rock
    // Classical
    // Hip hop
```

更多关于for-in循环的信息，参见[For-In Loops.](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID121)。

Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个`Set`中的值可以使用`sorted()`方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符`<`对元素进行比较的结果来确定.

```
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```

### 集合的操作 （Performing Set Operations）
我们可以有效地执行集合的基本操作，例如：
将两个集合组合在一起，确定两个集合共有的元素，或者确定两个集合是否相同，或者两个集合中不共有的元素。

##### 集合的基本运算（Fundamental Set Operations）
下图描绘了两组-a和b-以阴影区域表示的各种设置操作的结果。

![setVennDiagram_2x.png](https://static.kuwe.top/2019/6/p8EBzi4wVb1UOLBQkRhGCitOVvPOuvXMDwqCp7C40Km5piM7hiIAFSHqhDEaSAt5 "setVennDiagram_2x.png")

- 使用`intersection(_:)`方法根据两个集合中共同的元素创建的一个新的集合。
- 使用`symmetricDifference(_:)`方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
- 使用`union(_:)`方法根据两个集合中所有的元素创建一个新的集合。
- 使用`subtracting(_:)`方法将两个集合中不共有的元素创建一个新的集合。

```swift
// 集合的基本操作
func fundamentalSetOperations() {
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    // union() 方法会把oddDigits和evenDigits这两个集合合并成一个集合
    print( oddDigits.union(evenDigits).sorted())
    //  由于使用的是Set所以合并后的集合中会去除重复元素，然后使用`sorted()`排序，注意：sorted 后返回的是数组（数组是有序的）
    // 输出结果 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    // 将两个集合中共有的元素创建为一个集合
    print(oddDigits.intersection(evenDigits).sorted())
    // 输出结果 []
    
    // 将两个集合中不共有的元素创建为一个新集合
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    // 输出结果 [1, 9]
    
    // 获取 oddDigits 中不包含singleDigitPrimeNumbers的元素，singleDigitPrimeNumbers中 不包含oddDigits的元素
    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
    // 输出结果 [1, 2, 9]
}

```

##### 集合的成员关系和相等性（Set Membership and Equality）
下图描绘了三组-a，b和c-，其中重叠区域表示在组之间共享的元素。 设置a是set b的超集，因为a包含b中的所有元素。 相反，set b是set a的子集，因为b中的所有元素也包含在a中。 集合b和集合c彼此不相交，因为它们没有共同的元素。
![setEulerDiagram_2x.png](https://static.kuwe.top/2019/6/WsDYR1JcmfQndD2y25NhMWDKV3uzUJ3kgMsikQiDKfSRNEDQXCfg6e9YfUkDa4um "setEulerDiagram_2x.png")

- 使用“是否相等”运算符(`==`)来判断两个集合是否包含全部相同的元素。
- 使用`isSubset(of:)`方法来判断一个集合中的元素是否也被包含在另外一个集合中。
- 使用`isSuperset(of:)`方法来判断一个集合中包含另一个集合中所有的元素。
- 使用`isStrictSubset(of:)`或者`isStrictSuperset(of:)`方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
- 使用`isDisjoint(with:)`方法来判断两个集合是否不含有相同的元素(是否没有交集)。

```swift
// 集合的成员关系和相等性（Set Membership and Equality）
func SetMembershipAndEquality() -> Void {

    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    
    // 判断 houseAnimals中的元素 是否被包含在farmAnimals中
    print(houseAnimals.isSubset(of: farmAnimals))
    // true
    
    // 判断 farmAnimals 是否包含houseAnimals的所有元素
    print(farmAnimals.isSuperset(of: houseAnimals))
    // true
    
    // 判断两个集合中是否没有相同的元素
    print(farmAnimals.isDisjoint(with: cityAnimals))
    // true
}
```

### 字典（Dictionaries ）
字典中存储的是相同类型的key-value(键-值)的容器，与Set集合相同的是字典也是无序的。 每个value与唯一的key关联，该唯一的key就是字典中该value的标识符。 与数组中的项目不同，字典中的元素没有指定的顺序。 当我们需要根据标识符查找值时，可以使用字典，这与使用真实字典查找特定单词的定义的方式非常相似。

> 注意：
Swift 的`Dictionary`类型被桥接到`Foundation`的`NSDictionary`类。
更多关于在Foundation和Cocoa中使用Dictionary类型的信息，参见[Bridging Between Dictionary and NSDictionary.](https://developer.apple.com/documentation/swift/dictionary#2846239)。

##### 字典类型速记语法 （Dictionary Type Shorthand Syntax）
Swift字典的类型完整地写为`Dictionary<Key，Value>`，其中`Key`是可以用作字典键的值的类型，`Value`是字典为这些键存储的值的类型。

> 注意
字典中的`Key`的类型必须符合`Hashable`协议，就像集合的值类型一样。

我们还可以将缩写形式的字典类型写为`[Key：Value]`。 虽然这两种形式在功能上是相同的，但是简写形式是优选的，并且在引用字典的类型时在本指南中使用。

##### 创建一个空字典（Creating an Empty Dictionary）

- 1.我们可以像数组一样使用构造语法创建一个拥有确定类型的空字典：

```
    // 1.创建确定类型的空字典
    var namesOfIntegers = [Int: String]()
    // 或者
//    var namesOfIntegers = Dictionary<Int, String>()
    
```

此示例创建一个类型为`[Int：String]`的空字典，以存储人类可读的整数值名称。 它的键是`Int`类型，其值是`String`类型。

- 2.如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作`[:]`（中括号中放一个冒号）：

```
    namesOfIntegers[16] = "sixteen"
    // namesOfIntegers 中现在包含一对键值对
    namesOfIntegers = [:]
    // namesOfIntegers再次被初始化为空字典，虽然这一次没有明确其键值对类型，但是它还是一个[Int：String]类型的空字典
```

##### 使用字典字面量创建字典（Creating a Dictionary with a Dictionary Literal）
我们可以使用字典字面量来构造字典，这和我们刚才介绍过的数组字面量拥有相似语法。字典字面量是一种将一个或多个键值对写作`Dictionary`集合的快捷途径。

一个键值对是一个key和一个value的结合体。在字典字面量中，每一个键值对的键和值都由冒号分割。这些键值对构成一个列表，其中这些键值对由方括号包含、由逗号分割：
```
[key 1: value 1, key 2: value 2, key 3: value 3]
```

- 1.创建一个字典来存储国际机场的名称。 在这本词典中，`key`是三个字母的国际航空运输协会代码，`value`是机场名称：

```
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

`airports`被声明为`[String：String]`类型的字典，这意味着这个字典的键和值都是String类型。

> 注意：
`airports`字典被声明为变量（用`var`关键字）而不是常量（`let`关键字）因为后面的示例中会修改这个字典。

`airports`字典使用字典字面量初始化，包含两个键值对。第一对的键是YYZ，值是Toronto Pearson。第二对的键是DUB，值是Dublin。

这个字典语句包含了两个`String: String`类型的键值对。它们对应`airports`变量声明的类型（一个只有`String`键和`String`值的字典）所以这个字典字面量的任务是构造拥有两个初始数据项的airport字典。

- 2.和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。 airports字典也可以用这种简短方式定义：

```
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

因为这个语句中所有的键和值都各自拥有相同的数据类型，Swift 可以推断出`Dictionary<String, String>`是airports字典的正确类型。


##### 访问和修改字典的元素（Accessing and Modifying a Dictionary）
我们可以通过字典的方法和属性或使用下标语法来访问和修改字典。

- 1.与数组一样，通过只读`count`属性查找字典中的元素个数：

```
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print("The airports dictionary contains \(airports.count) items.")
    // 输出 "The airports dictionary contains 2 items."
```

- 2.使用Boolean 类型的`isEmpty`属性作为检查`count`属性是否等于0的快捷方式：

```
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary is not empty.")
    }
    // 输出 "The airports dictionary is not empty."
```

-  3.使用下标语法添加一个元素到字典中。 使用适当类型的新的key作为下标索引，并指定适当类型的新值：

```
    airports["LHR"] = "London"
    // airports 字典中现在包含三个元素
```

-  4.使用下标语法来改变特定键对应的值：

```
    airports["LHR"] = "London Heathrow"
    // "LHR" 对应的value现在被修改为"London Heathrow"
```

- 5.作为下标的替代方法，使用字典的`updateValue(_：forKey :)`方法来设置或更新特定键的值。 与上面的下标示例一样，`updateValue(_：forKey :)`方法设置键的值（如果不存在），或者如果该键已存在则更新该值。 但是，与下标不同，`updateValue(_：forKey :)`方法在执行更新后会返回旧值。 这使您可以检查是否进行了更新。

`updateValue(_: forKey:)`方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。
```
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    // Prints "The old value for DUB was Dublin."
```

- 6.使用下标语法从字典中检索特定键的值。 因为检索的键的值可能不存在，所以字典的下标返回字典值类型的可选值。 如果字典包含所请求键的值，则下标返回包含该键的现有值的可选值。 否则，下标返回nil：

```
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport is not in the airports dictionary.")
    }
    // 输出 "The name of the airport is Dublin Airport."
```

-  7.使用下标语法从字典中删除某个键值对，方法是将指定键为`nil`

```
    airports["APL"] = "Apple International"
    // APL键值对已经被添加到字典中
    airports["APL"] = nil
    // APL对应的键值对现在已被移除
```

- 8.使用`removeValue(forKey :)`方法从字典中删除键值对。 此方法删除键值对（如果存在）并返回已删除的值，如果不存在值，则返回nil：

```
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary does not contain a value for DUB.")
    }
    // 输出 "The removed airport's name is Dublin Airport."
```

##### 迭代字典 （Iterating Over a Dictionary）
我们可以使用`for-in`循环遍历字典中的键值对。 字典中的每个项都作为`(key,value)`元组返回，并且我们可以将元组的成员分解为临时常量或变量，作为迭代的一部分：

- 1.使用`for-in`循环遍历字典中的键值对

```swift
func IteratingOverDictionary() -> Void {
    
    // 1.使用`for-in`循环遍历字典中的键值对
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    // YYZ: Toronto Pearson
    // DUB: Dublin
}

```

查看更多[`For-In 循环`](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID121)的指南

- 2.通过访问`keys`或者`values`属性，也可以遍历字典的键或者值：

```
    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }
    // Airport code: YYZ
    // Airport code: DUB
    
    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    // Airport name: Toronto Pearson
    // Airport name: Dublin

```

- 3.如果我们需要使用带有Array实例的API的字典键或值，请使用keys或values属性初始化新数组：

```
    let airportCodes = [String](airports.keys)
    // airportCodes is ["LHR", "YYZ"]
    
    let airportNames = [String](airports.values)
    // airportNames is ["London Heathrow", "Toronto Pearson"]
```

Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的`keys`或`values`属性使用`sorted()`方法。
