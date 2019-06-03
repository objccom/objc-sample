### 简介
运算符是用于检查、更改或组合值的特殊符号或短语。例如，加法运算符（`+`）添加两个数字，如`let i=1+2`，逻辑与运算符（`&&`）组合两个布尔值，如`if enteredDoorCode && passedRetinaScan.`。

Swift支持大多数标准的C运算符，并改进了几种消除常见编码错误的功能。赋值运算符（`=`）没有返回值，以防止在预期使用等于运算符（`=`）时错误地使用它。算术运算符（`+`、`-`、`*`、`/`、`%`等）检测并禁止值溢出，以避免在处理大于或小于存储它们的类型的允许值范围的数字时出现意外结果。我们可以选择使用swift的溢出操作符来值溢出行为，如[溢出操作符](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID37)中所述。

Swift还提供在c语言中没有的范围运算符，例如`a.<b`和`a…b`，作为表示值范围的快捷方式。

本章介绍了swift中的常用运算符。[高级操作符](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html)涵盖了Swift的高级操作符，并描述了如何定义自己的自定义操作员和如何进行自定义类型的运算符重载。


### 术语 (Terminology )
运算符分为一元、二元或三元：

一元运算符对单个目标（如`-a`）进行操作。一元前缀运算符出现在其目标（例如`!b`）和一元后缀操作符出现在它们的目标之后（例如`c!`）.
二元运算符对两个目标（如`2 + 3`）进行操作，由于它们出现在两个目标之间，所以它们是中缀。
三元运算符作用于三个目标。像c语言一样，swift只有一个三元运算符，即三元条件运算符（`a ? b : c`）。
运算符影响的值是操作数。在表达式`1 + 2`中，`+`符号是一个二元运算符，它的两个操作数是值`1`和`2`。

### 赋值运算符 (Assignment Operator)
赋值运算符（assignment operator）基于右值（right operand）的值，给左值（left operand）赋值。
赋值运算符（`a = b`）用`b`值初始化或更新`a`的值：
```
let b = 10
var a = 5
a = b
print("a = \(a), b = \(b)")
// 输出结果 a = 10, b = 10
```

如果赋值预算符的右边是一个具有多个值的元组，那么它的元素可以一次分解为多个常量或变量，比如以下：
```
let (x, y) = (1, 2)
print("x = \(x), y = \(y)")
// 输出结果 x = 1, y = 2
```

与c语言和Objective-C语言中的赋值运算符不同，Swift中的赋值运算符本身没有返回值。所以下代码无效且无法编译用过：
```
if x = y {
// `if x = y`是无效的，因为`x = y`没有返回值，所以无法编译通过。
}
```
` if x = y`是无效的，实际上我们应该使用等于运算符`==`，而却赋值运算符`=`。

### 算术运算符 (Arithmetic Operators)
Swift支持所有数值类型的四个标准算术运算符：
- Addition加法（`+`）
- Subtraction减法（`-`）
- Multiplication乘法（`*`）
- Division除法（`/`）
```
let add = 1 + 2  // 结果为 3
let sub = 10 - 9 // 结果为 1
let mult = 7 * 2 // 结果为 14
let div = 120.8 / 20 // 结果为 6.04
print("add = \(add)")
print("sub = \(sub)")
print("mult = \(mult)")
print("div = \(div)")
```

与c和Objective-C中的算术运算符不同的是，Swift算术运算符默认不允许值溢出。那么我们可以选择使用swift的溢出运算符（如`a &+ b`）来值溢出行为。请参见[溢出运算符](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID37)。

通过加法运算符对字符串的拼接，比如：
```
print("hello, " + "world")
// 输出结果为 "hello, world"
```

##### 1.余数运算符 (Remainder Operator)
余数运算符，也叫取模运算符，（`a % b`）计算出b在a中的倍数，并返回剩余的值（称为余数）。

- 语法
```
var1 % var2
```

- 示例
```
12 % 5 // 2
-1 % 2 // -1
1 % 2 // 1
2 % 3 // 2
-4 % 2 // -0
5.5 % 2 // 1.5
```

> 注意
余数运算符（`%`）在其他语言中也称为取模运算符。然而，它对于负数的swift行为意味着，严格来说，它是一个余数而不是一个取模运算

下面是余数运算符的工作原理。要计算`9 % 4`，首先要计算出 4 的多少倍会刚好可以容入 9 中：
![remainderInteger_2x.png](https://blog.mmbbn.cn/2019/6/0rrUwJ7A83aSc1Kpk9sSzzEg16VX5531YAvDzCzorAKUKgrEZyxzboAGwjaMW9jq "remainderInteger_2x.png")
通过上图，我们可以看到9内放了两个4，那么余数就是1（以橙色显示）。

在swift中取余数运算，可以这么写：
```
9 % 4  // 结果，也就是余数为 1
```
要就是那`a % b`的结果，`%`运算符将计算出余数的结果并作为返回值返回：
```
a = (b x 倍数) + 余数
```
当倍数取最大值的时候，就会刚好可以放入到 a 中。
通过以上的说明，我们可以到达`9 % 4`的余数结果，那么他们的公式为:
```
9 = (4 x 2) + 1
```

在计算一个负数数（-9）的余数时，可使用相同的方法计算出余数：
```
-9 % 4 // 余数结果为-1
```

在方程式中插入-9和4可得出：
```
-9 = (4 x -2) + -1
```

在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的：
```
print("10 % 3 = \(10 % 3), 10 % -3 = \(10 % -3)")
// 输出结果 10 % 3 = 1, 10 % -3 = 1
```

##### 2.一元负号运算符 (Unary Minus Operator)
数值的符号可以使用前缀`-`即一元负号运算符进行切换：
```
let three = 3
let minusThree = -three       // minusThree 的值为 -3
let plusThree = -minusThree   // plusThree 的值为 3
print("three=\(three), minusThree=\(minusThree), plusThree=\(plusThree)")
// 输出结果 three=3, minusThree=-3, plusThree=3
```

一元负号运算符（`-`）直接写在它所操作的值之前（比如 `-3`），之间不能有任何空格（`- 3` 是不可以的）。

##### 3.一元正号操作符 (Unary Plus Operator)
一元正号运算符（`+`）只返回其操作的值，而不做任何更改：
```
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
```

虽然一元正号运算符实际上不做任何操作，但在代码中使用它为正数提供对称性，同时也使用一元减号运算符为负数提供对称性。

### 复合赋值运算符 (Compound Assignment Operators)
与c语言相似，swift提供了将赋值（`=`）与另一个操作组合在一起的复合赋值运算符。下面的例子是加法赋值运算符（`+=`）：
```
var a = 1
a += 2
// a 现在等于 3
```
表达式`a += 2`是`a = a + 2`的简写。实际上，加法和赋值被组合成一个同时执行两个任务的运算符。

> 注意
复合赋值运算符没有返回值。例如，你不能写`b = a += 2`。

有关swift标准库提供的操作符的信息，请参阅[操作符声明](https://developer.apple.com/reference/swift/swift_standard_library_operators)。

### 比较运算符 (Comparison Operators)
Swift支持c语言中所有的标准比较运算符：
- 等于 (a == b)
- 不等于 (a != b)
- 大于 (a > b)
- 小于 (a < b)
- 大于等于 (a >= b)
- 小于等于 (a <= b)

> 注意
Swift还提供两个标识运算符（`==`和`!==`），用于测试两个对象引用是否都引用同一对象实例。有关详细信息，请参见[标识运算符](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID90)。

- 语法
```
var1 == var2
```

- 返回值
```
Bool 类型
```

- 示例
```
1 == 1   // true 因为 1 等于 1
2 != 1   // true 因为 2 不等于 1
2 > 1    // true 因为 2 大于 1
1 < 2    // true 因为 1 小于 2
1 >= 1   // true 因为 1 大于等于 1
2 <= 1   // false 因为 2 不小于等于 1
```

每个比较运算符都有一个`Bool`类型的返回值，以表示该语句的结果是否为`true`

- 了解比较运算符
比较运算符通常用于条件判断语句，例如`if`语句：
```
let name = "world"
if name == "world" {
print("hello world.")
}
else {
print("I'm sorry \(name), but I don't recognize you")
}
// 输出结果 hello world.
```

有关`if`语句的更多信息，请参见[控制流](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)。

- 用比较运算符比较两个元组
如果两个元组具有可比较性（比如两个元组中有相同的类型和值的数量），那么我们也可以比较运算符比较它们。元组遵循从左到右进行比较，每次比较一个值，直到比较找到两个不相等的值。对这两个值进行比较，比较的结果决定了元组比较的总体结果。如果所有元素都相等，那么元组本身就相等。例如：
```
let flag = (1, "zebra") < (2, "apple") // true 这两个元组的第一个元素 1 小于 2，第二个元素"zebra" 和 "apple" 没有比较，所以以第一个元素的比较结果为这两个元组的比较结果
let flag1 = (3, "apple") < (3, "bird") // true 因为这两个元组的第一个元素 3 相等，并且“apple" 小于 "bird"(比较字母)，所以按照第二个元素的比较结果为这两个元组的比较结果
let flag2 = (4, "dog") == (4, "dog") // true 这两个元素的两个元素都是相同的，所以这两个元组相同
print("flag=\(flag), flag1=\(flag1), flag2\(flag2)")
// 输出结果 flag=true, flag1=true, flag2true
```
在上面的示例中，我们可以在第一行看到比较的规则时从左到右的顺序。因为1小于2，所以不管元组中是否有其他值，`(1, "zebra")`被认为小于` (2, "apple")`。虽然`"zebra"`并不比`"apple"`小，但是比较已经由元组(tuples)的第一个元素决定了。只有当元组的第一个元素相同时，会比较它们的第二个元素，这就是在第二行和第三行发生的情况。

- 对具有不可比较性元素的元组使用比较运算符比较时，无法编译通过
只有当运算符可以应用于各自元组中的每个值时，才能将元组与给定的运算符进行比较。例如，如下面的代码所示，可以比较两个类型`(String, Int)`的元组，因为可以使用`<`运算符比较`String`和`Int`的值。相反，两个类型`(String, Bool)`的元组不能与`<`运算符进行比较，因为`<`运算符不能应用于`Bool`值。
```
let flag3 = ("blue", -1) < ("purple", 1) // 可以比较
("blue", false) < ("purple", true)  // 不可以比较，因为`<`小于比较运算符不适用于布尔值之间的比较，所有无法编译通过，编译错误：`Binary operator '<' cannot be applied to two '(String, Bool)' operands`
```

> 注意：
Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。

