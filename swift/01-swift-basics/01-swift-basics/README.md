[翻译自swift.org](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

## 简介

Swift是一种用于iOS、MacOS、WatchOS和TVOS应用程序开发的新编程语言。尽管如此，从我们在c和Objective-C中开发的经验来看，swift的许多部分还是很熟悉的。

Swift提供所有基于c和Objective-C基本类型的自己版本，包括整数的`Int`、浮点值的`Double`和`Float`、布尔值的`Bool`和文本数据的`String`。Swift还提供了三种主要集合类型（`Array`、`Set`和`Dictionary`）的强大版本，如集合类型中所述。

与c语言类似，Swift使用变量通过标识名来存储和引用值。Swift还广泛使用其值不可更改的变量。这些被称为常量，并且比c语言中的常量强大得多。在Swift中，当您处理不需要更改的值时，常量用于使代码更安全、更清晰。

除了熟悉的类型之外，Swift还引入了在Objective-C中没有的高级类型，例如元组（tuples）。元组使您能够创建和传递值分组。可以使用元组以单个复合值的形式从函数返回多个值。

swift还引入了可选类型（optional types），用于处理缺少值的情况。可选类型表示“有一个值，它等于x”或“根本没有值”。使用选项类似于在Objective-C中对指针使用nil，但它们适用于任何类型，而不仅仅是类。在Objective-C中，可选类型不仅比空指针更安全、更具表现力，而且是Swift许多最强大功能的核心。

Swift是一种类型安全的语言，这意味着该语言可以帮助您明确代码可以使用的值的类型。如果代码的一部分需要字符串，类型安全将防止您错误地传递int。同样，类型安全防止您意外地将可选字符串传递给需要非可选字符串的代码段。类型安全可以帮助您在开发过程中尽早捕获和修复错误。

## 常量和变量 (Constants and Variables)
常量和变量将名称（如MaximumNumberOfLoginAttempts或WelcomeMessage）与特定类型的值（如数字10或字符串“hello”）相关联。常量的值一旦设置就不能更改，而变量将来可以设置为不同的值。

#### 1.声明常量和变量
常量和变量必须在使用之前声明。 使用`let`关键字声明常量，使用`var`关键字声明变量。 

下面是一个示例，说明如何使用常量和变量来跟踪用户进行的登录尝试次数：

- 声明`let`常量
```swift
/// 声明一个名为maximumNumberOfLoginAttempts的新常量，并将其值设为10
let maximumNumberOfLoginAttempts = 10
```

- 声明`var`变量
```swift
/// 声明一个名为currentloginatempt的新变量，并给它一个初始值0。
var currentLoginAttempt = 0
```

- 声明多个常量和变量
我们还可以在一行中声明多个常量或多个变量，用逗号分隔：
```swift
// 在一行中声明多个常量或多个变量，并初始化，注意对个需用逗号分隔：
var x = 0.0, y = 10.0, z = 20.0
// 修改变量的值
x = 99.8
y = 321.9
z = 119.9
// 打印结果
print("x=\(x), y=\(y), z=\(z)")
```

> 常量和变量的注意事项
如果代码中存储的值不变，请始终使用`let`关键字将其声明为常量。仅将`var`(变量)用于存储需要更改的值。

##### 2.类型注解（Type Annotations）
在声明常量或变量时，可以提供类型注释，以明确常量或变量可以存储的值的类型。通过将冒号放在常量或变量名之后，后跟空格，再后跟要使用的类型的名称来编写类型批注。

- 示例1
此示例为名为WelcomeMessage的变量提供了类型注释，以指示该变量可以存储字符串值：
```swift
// 声明一个String类型的welcomeMessage变量
var welcomeMessage: String
// 给welcomeMessage变量赋值
welcomeMessage = "hello world."
print(welcomeMessage)
```
声明中的冒号表示“…of type…”，因此上面的代码可以读取为：“声明一个名为WelcomeMessage的`String`类型变量。”

当一个welcomeMessage变量使用`String`为其类型注解后，在给其赋值时，必须为`String`类型，不然编译器无法编译通过。

- 示例2
在一行中声明多个常量或多个变量，并使用类型注解，以明确这些变量存储的数据类型，注意对个需用逗号分隔：

```swift
// 声明三个类型为Double的变量
var red, blue, green: Double
// 给这三个变量赋值
red = 100.0
blue = 180.0
green = 255.0
// 打印结果
print("red=\(red), blue=\(blue), green=\(green)")
```

> 注意事项
在实践中很少需要编写类型注释。如果在定义常量或变量时为其提供初始值，swift几乎总是可以推断将用于该常量或变量的类型，如类型安全和类型推断中所述。在上面的WelcomeMessage示例中，没有提供初始值，因此WelcomeMessage变量的类型是用类型注释指定的，而不是从初始值推断的。

##### 3.常量和变量的命名 (Naming Constants and Variables)
在未常量和变量命名时，我们几乎可以使用任何字符，包括Unicode字符：
```swift
let π = 3.14159
let 你好 = "你好世界"

```

常量和变量名不能包含空格字符、数学符号、箭头、专用Unicode标量值或线条和方框绘图字符。它们也不能以数字开头，尽管数字可能包含在名称中的其他地方。

一旦声明了某个类型的常量或变量，就不能用相同的名称再次声明它，也不能更改它来存储不同类型的值。你也不能把一个常数变成一个变量，或者把一个变量变成一个常数。

> 注意事项
如果需要为常量或变量提供与保留的swift关键字相同的名称，则在将其用作名称时，请用反勾号（`）将该关键字括起来。但是，除非您完全没有选择，否则请避免使用关键字作为名称。

可以将现有变量的值更改为其他兼容类型的值。在本例中，friendlywelcome的值从“hello！”更改为“hello！”“Bunjor！”：
```
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome变量的值 现在是 "Bonjour!，而不是Hello!"
```

与变量不同，常量的值在设置后不能更改。在编译代码时，尝试执行此操作将被报告为错误：
```
let languageName = "Swift"
languageName = "Swift++"
// 这将导致编译错误: languageName 常量的值一旦初始化后无法被改变
```

##### 4.输出常量和变量 (Printing Constants and Variables)
我们可以使用print函数在控制台输出常量和变量的值，print函数的定义为`public func print(_ items: Any..., separator: String = default, terminator: String = default)`

输出friendlyWelcome变量的值
```
print(friendlyWelcome)
// Prints "Bonjour!"
```

`public func print(_ items: Any..., separator: String = default, terminator: String = default)`函数是一个全局函数，它将一个或多个值打印到适当的输出。例如，在Xcode中，`print`函数在Xcode的“控制台”的窗口中打印其输出。separator和terminator参数具有默认值，因此调用此函数时可以省略它们。默认情况下，函数通过添加换行符来终止它打印的行。若要在值后面打印不带换行符的值，请传递一个空字符串作为终止符，例如`print(someValue, terminator: "")`。有关具有默认值的参数的信息，请参见[默认参数值](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID169)。

swift使用字符串插值将常量或变量的名称作为长字符串中的占位符，并提示swift将其替换为该常量或变量的当前值。将名称括在括号中，并在左括号前用反斜杠`\`转义：
```
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// 输出的结果为 "The current value of friendlyWelcome is Bonjour!"
```

> 注意事项
字符串插值中描述了所有可用于[字符串插值的选项](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID169)。

### 代码注释 (comments)
请将你的代码中的非执行文本注释成提示或者笔记以方便你将来阅读。Swift 的编译器将会在编译代码时自动忽略掉注释部分。

- 单行注释
swift中的注释与c语言中的注释非常相似。单行注释以两个正斜杠（//）开头：
```
// 这是一个注释
```

- 多行注释

多行注释以正斜杠开头，后跟星号（/*），以星号结尾，后跟正斜杠（*/）：
```
/* 这是一个
多行注释*/
```

- 嵌套的多行注释
与 C 语言多行注释不同，Swift 的多行注释可以嵌套在其它的多行注释之中。你可以先生成一个多行注释块，然后在这个注释块之中再嵌套成第二个多行注释。终止注释时先插入第二个注释块的终止标记，然后再插入第一个注释块的终止标记：
```
/* 这是第一个多行注释的开头
/* 这是第二个被嵌套的多行注释 */
这是第一个多行注释的结尾 */
```

嵌套的多行注释使您能够快速、轻松地注释掉大块代码，即使代码已经包含多行注释。


### 分号 (Semicolons )
与许多其他语言不同，Swift不要求您在代码中的每个语句后编写分号（`；`），尽管您可以根据需要这样做。但是，如果要在一行上编写多个单独的语句，则需要分号：
```
let cat = "hello wold"; print(cat)
// 输出: hello wold
```

### 整数 (Integers )
整数是不含小数部分的整数，如42和-23。整数有符号（正、零或负）或无符号（正或零）。

swift以8、16、32和64位格式提供有符号和无符号整数。这些整数遵循类似于c语言的命名约定，其中8位无符号整数的类型为`uint8`，32位有符号整数的类型为`int32`。就像 Swift 的其他类型一样，整数类型采用大写命名法。

##### 整数范围
swift的底层为我们提供了不同类型整数的`max`和`min`，获取其最大值和最小值的属性，比如我们要查看`UInt8`这个整数类型的最大值和最小值
```
let maxValue = UInt8.max
let minValue = UInt8.min
print("UInt8这个整数类型的最大值=\(maxValue)\n最小值=\(minValue) ")
//输出结果为：UInt8这个整数类型的最大值=255
最小值=0 
```

这些属性的值具有适当大小的数字类型（例如上面示例中的UInt8），因此可以在表达式中与其他相同类型的值一起使用。

##### Int 
在大多数情况下，我们不需要选择特定大小的整数来在代码中使用。swift提供了一个额外的整数类型`Int`，其大小与当前平台的本机字大小相同：

- 在32位平台上，`Int`的大小与`Int32`相同。
- 在64位平台上，`Int`的大小与`Int64`相同。

在我们声明整数类型的变量或常量时，除非需要使用特定大小的整数，否则代码中用`Int`来声明整数类型。这有助于代码一致性和互操作性。即使在32位平台上，`Int`也可以存储`-2147483648`和`2147483647`之间的任何值，大多数时候这已经足够大了。

##### UInt
swift还提供无符号整数类型`UInt`，其大小与当前平台的本机字大小相同：

- 在32位平台上，`UInt`的大小与`UInt32`相同。
- 在64位平台上，`UInt`的大小与`UInt64`相同。

> 注意
仅当您特别需要与平台本机字大小相同的无符号整数类型时才使用uint。如果不是这样，那么最好使用int，即使要存储的值已知为非负。对整数值使用int的一致性有助于代码互操作性，避免在不同的数字类型之间转换，并匹配整数类型推理，如[类型安全和类型推理](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID322)中所述。

### 浮点数 (Floating-Point Numbers)
浮点数是带有小数部分的数字，如3.14159、0.1和-273.15。

浮点类型可以表示比整数类型宽得多的值范围，并且可以存储比`Int`中存储的大得多或小得多的数字。Swift提供了两种带符号的浮点数字类型：

- `Double`表示64位浮点数字。
- `Float`表示32位浮点数。

> 注意
`Double`的精度至少为15位十进制数字，而`Float`的精度可以是6位十进制数字。要使用的适当浮点类型取决于代码中需要使用的值的性质和范围。在任何一种类型都合适的情况下，首选`Double`。

### 类型安全和类型推断 (Type Safety and Type Inference)

swift是一种类型安全（type-safe）的语言。类型安全语言鼓励您明确代码可以使用的值的类型。如果代码的一部分需要一个`String`类型，则不能错误地传递`Int`类型，这样在编译阶段就无法通过。

因为swift是类型安全的，所以它在编译代码时执行类型检查，并将任何不匹配的类型标记为错误。这使您能够在开发过程中尽早捕获和修复错误。

使用不同类型的值时，类型检查有助于避免错误。但是，这并不意味着您必须指定声明的每个常量和变量的类型。如果不指定所需的值类型，swift将使用类型推断来计算适当的类型。类型推断使编译器能够在编译代码时，通过检查您提供的值，自动推断特定表达式的类型。

由于类型推断的缘故，与C或Objective-C等语言相比，Swift需要的类型声明要少得多。常量和变量仍然是显式类型化的，但是指定其类型的大部分工作都是为您完成的。

当用初始值声明常量或变量时，类型推断特别有用。这通常是通过在声明常量或变量时为其指定一个文本值（或文本）来实现的。（文字值是直接出现在源代码中的值，如下面示例中的42和3.14159。）

例如，如果您将42的文字值赋给一个新常量，而没有说明它是什么类型，那么Swift会推断您希望该常量是一个`Int`，因为您已经用一个看起来像整数的数字初始化了它：
```
let meaningOfLife = 42
// meaningOfLife 这个常量被推断为Int类型
```

同样，如果不为浮点文字指定类型，swift会推断您要创建`Double`：
```
let pi = 3.14159
// pi 这个常量被推断为Double类型
```

在推断浮点数的类型时，swift总是选择`Double`（而不是`FLoat`）。

如果表达式中同时出现了整数和浮点数，会被推断为 Double 类型：
```
let anotherPi = 3 + 0.14159
// anotherPi 这个常量也被推断为Double类型
```
上面的示例中的anotherPi中原始值 3 没有显式声明类型，而表达式中出现了一个浮点数0.14159与其相加，所以表达式会被推断为` Double` 类型。

### 数字型的字面量 (Numeric Literals)
整型的字面量可以写为：
- 无前缀的十进制数
- 带0B前缀的二进制数
- 带0o前缀的八进制数
- 前缀为0x的十六进制数

下面这些常量的所有整数字面量的十进制值都是17:
```
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 的二进制
let octalInteger = 0o21           // 17 的八进制
let hexadecimalInteger = 0x11     // 17 的十六进制

print("binaryInteger=\(decimalInteger), binaryInteger=\(binaryInteger), octalInteger=\(octalInteger), hexadecimalInteger=\(hexadecimalInteger)")
// 输出结果 binaryInteger=17, binaryInteger=17, octalInteger=17, hexadecimalInteger=17
```

浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 `0x`）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的`e` 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。

对于指数为exp的十进制数，基数乘以10exp：
- 1.25e2 表示 1.25 x 102 或者 125.0。
- 1.25e-2 表示 1.25 x 10-2 或者 0.0125。

对于指数为exp的十六进制数，基数乘以2exp：
- 0xFp2 表示 15 x 22  或者 60.0.
- 0xFp-2 表示 15 x 2-2 或者 3.75.

下面的这些浮点字面量都等于十进制的12.1875：
```
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
print("decimalDouble=\(decimalDouble), exponentDouble=\(exponentDouble), hexadecimalDouble=\(hexadecimalDouble)")
// 输出结果 decimalDouble=12.1875, exponentDouble=12.1875, hexadecimalDouble=12.1875
```

数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
```
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
print("paddedDouble=\(paddedDouble), oneMillion=\(oneMillion), justOverOneMillion=\(justOverOneMillion)")
// 输出结果 paddedDouble=123.456, oneMillion=1000000, justOverOneMillion=1000000.0000001
```

### 数值型转换 (Numeric Type Conversion)
通常来讲，即使代码中的整数常量和变量已知非负，也请使用Int类型。总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。

只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据。

##### 整型之间的转换 (Integer Conversion)
不同整数类型的变量和常量可以存储不同范围的数字。`Int8`类型的常量或者变量可以存储的数字范围是`-128~127`，而`UInt8`类型的常量或者变量能存储的数字范围是`0~255`。如果数字超出了常量或者变量可存储的范围，编译的时候会报错：
```
let cannotBeNegative: UInt8 = -1
// UInt8不能存储负数，因此编译时出错：Negative integer '-1' overflows when stored into unsigned type 'UInt8'
let tooBig: Int8 = Int8.max + 1
// Int8不能存储大于它最大值的数字， 因此编译时出错：Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
```

由于每种数值类型都可以存储不同的值范围，所以您必须根据具体情况选择进行数值类型转换。这种选择加入方法可以防止隐藏的转换错误，并有助于在代码中明确类型转换意图。

将一种数值的类型转换为另外一种数值类型，可以将这种数值初始化为所需的数值类型。在下面的示例中，常量twothousand的类型为`UInt16`，而常量twothousand的类型为`UInt8`。它们不能直接添加到一起，因为它们不是同一类型的。相反，此示例调用`UInt16(one)`创建一个新的`UInt16 `，该`UInt16 `的值为1，并使用此值代替原始值：
```
let twoThousand: UInt16 = 2_000
let one: UInt8  = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print("twoThousandAndOne=\(twoThousandAndOne)")
```

因为加法的两边现在都是`UInt16`类型，所以允许加法。输出常数（twothousandandone）被推断为`UInt16`类型，因为它是两个`UInt16`值的总和。

`SomeType(ofInitialValue)`是调用swift类型的初始值设定项并传入初始值的默认方法。在幕后，`UInt16`具有接受`UInt8`值的初始值设定项，因此此初始值设定项用于从现有`UInt8`生成新的`UInt16`。此处不能传递任何类型，但它必须是`UInt16`提供初始值设定项的类型。扩展现有类型以提供接受新类型（包括您自己的类型定义）的初始值设定项包含在[扩展](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)中。

##### 整型和浮点型之间的转换 (Integer and Floating-Point Conversion)

整数和浮点数之间必须显式转换类型
```
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
print("pi=\(pi)")
// pi的值为3.14159，其类型被自动推断为Double类型
```

这里，常量three的值用于创建类型`Double`的新值，这样加法的两边都是相同的类型。如果没有这个转换，就不允许添加。

浮点到整数的转换也必须是显式的。整数类型可以用`Double`或`Float`值初始化：
```
let integerPi = Int(pi)
print("integerPi=\(integerPi)")
// integerPi 的值为3，并且被类型推断为Int类型
```
用这种方法初始化新的整数值时，浮点值总是被截断。这意味着4.75变为4，-3.9变为-3。

> 注意：
结合数字类常量和变量不同于结合数字类字面量。字面量3可以直接和字面量0.14159相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。

### 类型别名 (Type Aliases)
类型别名就是个现有类型定义替代的名称。使用`typealias`关键字定义类型别名。
```
typealias <#type name#> = <#type expression#>
```
当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数据：
```
// 给UInt16起一个别名为AudioSample
typealias AudioSample = UInt16
```

定义类型别名后，可以在可能使用原始名称的任何位置使用别名：
```
var maxAmplitudeFound = AudioSample.max
print("maxAmplitudeFound=\(maxAmplitudeFound)")
//  maxAmplitudeFound 的值现在是 0
```
这里，`AudioSample`被定义为`UInt16`的别名。因为它是一个别名，所以对`AudioSample.max`的调用实际上调用了`UInt16.min`，所有`maxAmplitudeFound`变量的值为0。

### 布尔值 (Booleans )
Swift有一个基本的布尔类型，称为`Bool`。布尔值被称为逻辑值，因为它们只能是真或假。swift提供两个布尔常量值`true` 和 `false` ：
```
let orangesAreOrange = true
let turnipsAreDelicious = false
```
`orangesAreOrange`和`turnipsAreDelicious`这两个常量的类型被推断为`Bool`，因为它们是用布尔文字值初始化的。与上面的`Int`和`Double`一样，如果在创建常量或变量时将其设置为`true`或`false`，则不需要将它们声明为`Bool`。类型推断有助于使swift代码在用其他类型已知的值初始化常量或变量时更加简洁和可读。

布尔值在处理条件控制语句（如`if`语句）时特别有用：
```
if turnipsAreDelicious {
print("Mmm, tasty turnips")
}
else {
print("Eww, turnips are horrible.")
}
// 输出结果为 Eww, turnips are horrible.
```

条件语句（如`if`语句）在[控制流](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)中有更详细的介绍。

当我们在给一个`Bool`类型的变量赋值为非`Bool`类型的值时，编译器会报错，下面示例演示编译时的报错：
```
let i = 1
if i {
// 这个示例无法编译通过，并且会报告错误：'Int' is not convertible to 'Bool'
}
```

但是，下面的替代示例是有效的：
```
let i = 1
if i == 1 {
// 编译通过
}
```

i == 1 的比较结果是 Bool 类型，所以第二个例子可以通过类型检查。类似 i == 1 这样的比较，请参考[基本操作符](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html)。

与swift中的其他类型安全示例一样，此方法避免了意外错误，并确保特定代码部分的意图始终是明确的。

### 元组 (Tuples )
元组将多个值组合成一个复合值。一个元组中的值可以是任何类型，并且不必是彼此相同的类型。

- 初始化元组

在下面示例中，（404，“未找到”）是一个描述HTTP状态代码的元组。HTTP状态代码是Web服务器在请求网页时返回的特殊值。如果您请求的网页不存在，则返回状态代码404 Not Found。
```
// 初始化一个元组
let http404Error = (404, "Not Found")
print("http404Error=\(http404Error)")
// http404Error 是一个(Int, String)类型的元组, 它的值为 (404, "Not Found")
```
（404，“未找到”）类型的元组将一个`Int`和一个`String`组合在一起，为HTTP状态代码提供两个单独的值：一个数字和一个人类可读的描述。它可以描述为“类型为`(Int, String)` 类型的元组”。

你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为` (Int, Int, Int) `或者` (String, Bool)` 或者其他任何你想要的组合的元组。

- 获取元组的元素

您可以将元组的内容分解为单独的常量或变量，然后像往常一样访问这些常量或变量：
```
// 将元组的内容分解为单独的常量或变量，然后像往常一样访问这些常量或变量：
// 下面将http404Error分解为statusCode, statusMessage
let (statusCode, statusMessage) = http404Error
print("Http 的 状态码为：\(statusCode)")
print("Http 状态描述为：\(statusMessage)")
```

如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线`(_)`标记，比如：
```
// 下面只要http404Error这个元组的第一个元素的值
let (statusCode1, _) = http404Error
print("statusCode1=\(statusCode1)")
// 打印结果为：statusCode1=404
```

另外，还可以通过下标获取元组的某个元素：
```
print("Http 状态码为：\(http404Error.0)")
// Http 状态码为：404
print("Http 状态描述为：\(http404Error.1)")
// Http 状态描述为：Not Found
```

在定义元组时，可以为元组的单个元素命名：
```
let http200Status = (statusCode: 200, statusMessage: "OK!")
```
如果在元组中命名元素，则可以使用元素名称访问这些元素的值：
```
// 在定义元组时，可以为元组的单个元素命名：
let http200Status = (statusCode: 200, description: "OK!")

// 如果在元组中命名元素，则可以使用元素名称访问这些元素的值：
print("状态码是 \(http200Status.statusCode)")
// 输出 状态码是 200
print("状态描述为 \(http200Status.description)")
// 输出 状态描述为 OK!
```

作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。请参考[函数参数与返回值](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID164)。

> 注意：
元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。请参考[类和结构体](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)。

### 可选类型 (Optionals)
在一个值可能为空的时候我们要使用可选类型。可选类型代表两种可能性：要么有值，可以解开该可选类型的值以访问该值，要么根本没有值。

> 注意
在c或objective-c中没有可选类型的概念。objective-c中最接近的一点是能够从一个方法中返回nil，否则将返回一个对象，nil意味着“缺少有效对象”。但是，这只适用于对象，它不适用于结构、基本c类型或枚举值。对于这些基本类型，Objective-C方法通常返回一个特殊值（如NSNotFound），以指示没有值。这种方法假定方法的调用者知道有一个特殊的值需要测试，并记住检查它。Swift的可选类型允许您指定任何类型的值都不存在，而不需要特殊的常量。

下面的示例说明如何使用可选类型来处理缺少值的情况。swift的`Int`类型有一个初始值设定项，它试图将字符串值转换为`Int`值。但是，并非每个字符串都可以转换为整数。字符串“123”可以转换为数值123，但字符串“hello，world”没有要转换的明显数值。

下面的示例使用构造函数尝试将一个`String`类型的值转换为`Int`类型：
```
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推断为 "Int?", or "optional Int"，这既是可选类型
```
上面`convertedNumber`是一个可选的`Int`类型，因为在使用`Int`的便利构造函数初始化时可能会失败，所有它返回的是可选类型的`Int` 类型，而非绝对的`Int`类型。一个可选的 `Int` 被写作`Int?` 而不是 `Int`。那么这意味着，它可能包含`Int`的值，也可能它什么都不包含，(例如`Boo`l值或`String`值。要么是一个`Int`，要么什么都不是）。

##### 空值 (nil)
给可选类型的变量指定特殊值`nil`，可以将其设置为无值状态：
```
// 初始化一个可选类型的变量，在类型后面使用`?`声明一个可选类型
var serverResponseCode: Int? = 404
serverResponseCode = nil
print("serverResponseCode=\(serverResponseCode)")
// 注意
// 使用`?`声明可选类型，使用`!`对可选类型解包
// 如果对值为nil的可选类型变量强制解包时，在运行时会抛出异常：Fatal error: Unexpectedly found nil while unwrapping an Optional value
```

>    注意
使用`?`声明可选类型，使用`!`对可选类型解包
如果对值为nil的可选类型变量强制解包时，在运行时会抛出异常：Fatal error: Unexpectedly found nil while unwrapping an Optional value
另外， nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。

当我们声明一个可选类型的常量或者变量时，没有给其赋值，那么它自动设置为nil：
```
var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil
```

> 注意
Swift的`nil`与objective-c中的`nil`不同。在objective-c中，`nil`是指向不存在对象的指针。在swift中，`nil`不是指针，它是一个明确的值（表示缺少某种类型的值）。任何类型的可选类型都可以设置为nil，而不仅仅是对象类型。

##### 使用`if`语句对可选类型解包 (If Statements and Forced Unwrapping)
我们可以使用`if`语句通过将可选项与`nil`进行比较来确定可选项是否包含值。还可以使用“等于”运算符（`==`）或“不等于”运算符（`!=`）来确定。

如果一个可选类型有值，那么它就不等于`nil`：
```
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
print("convertedNumber 包含一些整数的值.")
}
```

一旦一个可选类型确定类包含非`nil`的值，那么通过在该选项类型属性的结尾添加`!`访问这个值。`!`标识符表达的是：明确确定该可选类型确定存在非`nil`的值，使用`!`解开这个可选类型，以获取到这些值。这里`!`就是强制解包。
```
if convertedNumber != nil {
print("convertedNumber 包含一些整数的值.")
// 通过`convertedNumber != nil`以明确确定`convertedNumber`存在非nil的值，那么我们通过`!`解包，获取这些值，这就是强制解包
print("convertedNumber 有一个整数的值为\(convertedNumber!)")
// 输出的结果：convertedNumber 有一个整数的值为123
```

有关if语句的更多信息，请参见[控制流](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)。


> 注意
尝试使用`!`对不存在的可选值进行强制解包，可能会导致运行时错误。在使用`nil`强制解包之前，请务必确保这个可选类型中含非`nil`值。

##### 可选绑定 (Optional Binding)




