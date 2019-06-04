翻译自[swift.org] swift5.1(https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)

### 简介
字符串是由一系列字符，如“hello, world”或“albatross ”。Swift中的字符串是`String`类型。除了 `String` 类型外，还多一种 `Character`（C语言中称之为 `Char`，叫做字符类型）类型，字符串的内容可以通过多种方式访问，包括作为`Character `的值的集合访问。

Swift的`String`和`Character `类型提供了一种快速、符合Unicode的方式来处理代码中的文本。字符串的创建和操作的语法是轻量级和易读的，字符串文字语法类似于C语言。字符串连接的连接可以通过`+`运算符简单的完成。声明字符串时通过`let`常量表明是不可变字符串，通过`var`变量声明一个可变字符串，就像swift中的任何其他值一样。也可以使用字符串将常量、变量、文本和表达式插入较长的字符串中，这一过程称为字符串插值。这使得为显示、存储和打印创建自定义字符串值变得容易。

swift中的`String` 类型是一种快速、现代化的字符串实现，每一个字符串都是由编码无关的 Unicode 字符组成，并支持访问字符的多种Unicode表达形式。

> 注意
我们可以用`Foundation`，实现swift中的`String`与`NSString` 进行桥接。`Foundation`还扩展了`NSString`中定义的方法。这意味着，如果导入`Foundation`，则可以在不转换的情况下让`String`类型的字符串访问`NSString`中定义的方法。
有关将`String`与`Foundation`和`Cocoa`一起使用的更多信息，请参阅[`String`和`NSString`之间的桥接](https://developer.apple.com/documentation/swift/string#2919514)。

### 字符串文本 (String Literals)
我们可以在代码中包含作为字符串文本的预定义字符串值。字符串是由双引号(`""`)内的字符组成的序列。

声明一个常量或变量，并使用字符串文本作为其初始化值：
```
let someString = "Some string literal value"
print("someString=\(someString)")
// 输出 someString=Some string literal value
```
以上代码，swift根据`someString`常量右侧的值，将其推断为`String`变量。

##### 多行字符串文本 (Multiline String Literals)
如果需要写一个跨多行的字符串文本时，请使用多行字符串文字，它是由三个双引号（`""" 中间是多行字符串"""`）包围的字符序列：
```
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
/* 输出结果
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
*/
```

多行字符串文字包含其左引号和右引号之间的所有行。字符串从左引号`(""")`后的第一行开始，到右引号前的一行结束，这意味着下面的字符串都不是以换行符开始或结束的：
```
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print("单行字符串=\(singleLineString)")
print("多行字符串=\(multilineString)")
// 输出结果
// 单行字符串=These are the same.
// 多行字符串=These are the same.
```

多行字符串文本中的换行与转义符号。多行字符串文本换行有两种方式：一是在文本内容中添加空的行或者直接文本换行，二是在文本内容在添加换行符（`\n`）。第一种方式的换行比较直观且易于阅读。当然有时我们需要易于阅读但是实际上让文本不换行时，我们可以在某一行行尾添加转义字符（\），以连接下一行的字符串，告诉编译器与后面的是相邻的，且不换行。
```
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("softWrappedQuotation=\(softWrappedQuotation)")
/* 输出结果
softWrappedQuotation=The White Rabbit put on his spectacles.  "Where shall I begin, please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on till you come to the end; then stop."
*/
```

要使多行字符串以换行符开头或结尾，请将空行作为第一行或最后一行。例如：
```
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("lineBreaks=\(lineBreaks)")
/*
输出结果
lineBreaks=
This string starts with a line break.
It also ends with a line break.
*/
```

多行字符串可以缩进以匹配周围的代码。结束引号` (""")`前的空格告诉Swift在所有其他行之前要忽略哪些空格。但是，如果在行首写空白，除了结束引号之前的内容外，还包括空白。
```
let linesWithIndentation = """
This line doesn't begin with whitespace.
This line begin with four spaces.
This line doesn't begin with whitespace.
"""
print("linesWithIndentation=\(linesWithIndentation)")
```
![multilineStringWhitespace_2x.png](https://blog.mmbbn.cn/2019/6/RordBx7VUErVkpYzrDIvyY1KFsXEOyqLjZcbbr53nO1ntXq4K8r2Z7SClI0OiqpP "multilineStringWhitespace_2x.png")

在上面的示例中，即使整个多行字符串文字是缩进的，字符串中的第一行和最后一行也不会以任何空白开头。中间一行的缩进量比右引号多，所以它从额外的四个空格缩进开始。

##### 字符串文本中的特殊字符 （Special Characters in String Literals）
字符串文字可以包括以下特殊字符：
- 转义的特殊字符` \0`（空字符）、`\\ `（反斜杠）、`\t`（水平制表符）、`\n`（换行符）、`\r`（回车符）、`\"`（双引号）和 `\'`（单引号）
- 一个任意的unicode标量值，写为`\u{n}`，其中`n`是一个1~8位十六进制数（请参考[unicode](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#ID293)）

下面的代码演示了这些特殊字符的四个示例。`wiseWords `常量包含两个转义双引号。`dollarSign `、`blackHeart `和`sparklingHeart `常量演示Unicode标量格式：
```
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein（爱因斯坦）"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // , Unicode scalar U+1F496
print("wiseWords=\(wiseWords)")
print("dollarSign=\(dollarSign)")
print("blackHeart=\(blackHeart)")
print("sparklingHeart=\(sparklingHeart)")
/*
输出内容
wiseWords="Imagination is more important than knowledge" - Einstein
dollarSign=$
blackHeart=
sparklingHeart=
*/
```
![屏幕快照 2019-06-04 下午4.11.32.png](https://blog.mmbbn.cn/2019/6/ftpyoBvFzsIGuNrqRC9Sc0EQjszAObywdWkjcsNKbHuPkhINUv4oS9VJTNFB2vDh "屏幕快照 2019-06-04 下午4.11.32.png")

在多行字符串中，可以直接包含`”“`双引号。 因为多行字符串是使用两个三双引号`""""""`，所以不必像Objective-C中那样还要使用转义字符\，如果在多行字符串使用`"""`，那么必须要使用至少一个转义字符.
```
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print("threeDoubleQuotationMarks=\(threeDoubleQuotationMarks)")
/* 输出
threeDoubleQuotationMarks=Escaping the first quotation mark """
Escaping all three quotation marks """
*/
```

##### 字符串扩展分隔符 (Extended String Delimiters)
我们可以将字符串放到客栈分隔符中，这样可以让字符串中的特殊字符直接显示出来，而不显示他们的效果。将字符串放在引号`""`内，并用符号`##`将其括起来。
例如，打印字符串文字`#"Line 1\nLine 2"#`，打印结果中的`\n`字符本身是换行符，但是它本身被打印出来了，而并不是起到换行的作用。
```
// 将`name1`这个字符串中的子字符串`\n`显示出来，而不是对name1进行换行的效果
let name1 = #"Line 1\nLine 2"#
print("name1=\(name1)")
```

如果需要字符串文字中字符的特殊效果，请匹配转义符（\）后面字符串中`#`符号的数量。例如，如果此字符串是`#"Line 1\nLine 2"#`，并且想要断开该行，则可以使用`#"Line 1\#nLine 2"#`。同样，`###"Line1\###nLine2"### `也会破坏该行。
```
// 在`##`中包含的字符也要显示换行的效果
let name2 = #"Line 1\#nLine 2"#
print("name2=\(name2)")
// 注意：当我们在\和n之间写几个#号时，也要在最外面写几个#号，实际上他们的效果是一样的，比如
let name3 = ##"Line 1\##nLine 2"##
print("name3=\(name3)")
```

使用扩展分隔符创建的字符串文本也可以是多行字符串文本。可以使用扩展分隔符将文本`"""`包含在多行字符串中，覆盖以文本结尾的默认行为。例如：
```
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
```

### 初始化一个空字符串 (Initializing an Empty String)
要创建一个空字符串值作为生成较长字符串的起点，请为变量分配一个空字符串文字，或使用初始值设定项语法初始化一个新的字符串实例：
```
// 创建空串
var emptyString = "" // 初始化一个空的文本字符串
var anthorEmptyString = String() // 使用String 的初始化方法初始
// 这两个方法初始化的字符串都是空串，且都是相同的

```

我们可以通过检查`String `类型的值`isEmpty `属性来确定字符串值是否为空，`isEmpty `返回值为`Bool`类型：
```
// 创建空串
var emptyString = "" // 初始化一个空的文本字符串
var anthorEmptyString = String() // 使用String 的初始化方法初始
// 这两个方法初始化的字符串都是空串，且都是相同的

if emptyString.isEmpty {
print("emptyString 是空字符串")
}
// 输出结果 emptyString 是空字符串
```

### 字符串的可变性 (String Mutability)
我们需要通过`var`定义一个变量来表明一个特定的字符串能被修改，或者通过`let`定义一个常量来表明它不能被修改。
```
// 使用var初始化一个可变的字符串变量
var variableString = "Horse"
// 可变字符串可以修改
variableString += " and carriage"
// 现在variableString变量已经被修改为 "Horse and carriage"

// 使用let 初始化一个不可变字符串常量
let constantString = "Highlander"
// 不可变字符串不可被修改
//    constantString += " and another Highlander"
// 对不可变字符串进行修改，会导致编译时无法通过：Left side of mutating operator isn't mutable: 'constantString' is a 'let' constant
```

> 注意:
Swift与Objective-C和Cocoa中的可变字符串不同，在Objective-C和Cocoa中，我们需要选择不同的类（`NSString`与`NSMutablString`）来表明字符串是否能被修改。

### 字符串是值类型 (Strings Are Value Types)
Swift的`String`类型是一个值类型。 如果我们创建一个新的`String`，该字符串在传递给函数或方法时将会被复制，或者当它被分配给常量或变量时也会被复制。 在所有的情况下，将创建现有`String`的新副本，并且新副本将被传递或分配，而不是原始版本。 值类型在[Structures and Enumerations Are Value Types](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID88)中有所描述。
Swift的copy-by-default `String`行为确保当函数或方法传递一个`String`值时，无论它来自哪里，我们都将拥有这个真实可靠的`String`值。可以确保我们传递的字符串不会被修改，除非我们自己修改。

在Swift的编译器的内部，它优化了字符串性能，使得只有在必要时才对字符串进行实际复制。 这意味着在使用字符串作为值类型时，总是会获得很好的性能表现。

在Swift的编译器的内部，它优化了字符串性能，使得只有在必要时才对字符串进行实际复制。 这意味着在使用字符串作为值类型时，总是会获得很好的性能表现。

##### 字符的使用 (Working with Characters)
使用`for-in`遍历字符串中的每一个字符（Character ）：
```
// 使用for-in遍历字符串中的每一个字符
for character in "Dog!" {
print(character)
}
// D
// o
// g
// !
```

如果想了解`for-in`循环，请查看[For-In Loops](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID121)

当然，我们也可以从仅含有一个字符的字符串中，通过指明`Character `（字符）类型来创建一个独立的`Character `常量或变量。
```
// 创建单个字符的`Character`类型
let exclamationMark: Character = "!"
```

通过`Character`字符数组构造一个`String`。`String`类型有一个便利构造函数，用于初始化一个`String`类型的字符串，它的参数是`Character`类型的数组，通过传入这个参数，可以构造一个`String`类型的字符串：
```
// 通过String的参数为Character的数组的构造函数，初始化一个`String`类型的字符串
let catCharacters: [Character] = ["C", "a", "t", "!"] // 数组中的每一个元素都是`Character`类型的字符
// 通过`Character`字符数组构造一个`String`
let catString = String(catCharacters)
print("catString=\(catString)")
// 输出结果 catString=Cat!
```

##### 字符串与字符串之间的拼接 (Concatenating Strings and Characters)
可以使用加法运算符`+`将字符串值拼接在一起，返回新的字符串值：
```
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print("welcome=\(welcome)")
// welcome 现在等于 "hello there"
```
使用`+=`加法赋值运算符，将一个字符串拼接到现在字符串中：

还可以使用`String`类型的`append()`方法将一个非`nil`的`Character `类型的值添加到`String`变量中：
```
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print("welcome=\(welcome)")
// welcome 现在等 "hello there!"
```

> 注意
不能将字符串或字符附加到现有的`Character `字符变量，因为`Character `字符类型的值只能包含一个字符。

当我们使用多行字符串时，则字符串中的每一行都要以换行符结尾，这也包括最后一行，例如：
```
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart+end)
/* 输出
one
twothree
*/

let goodStart = """
one
two

"""
print(goodStart+end)
/*
输出
one
two
three
*/
```
在上面的代码中，将`badStart `与`end`连接将生成一个两行字符串，这不是所需的结果。因为`badStart `的最后一行不会以换行符结束，所以该行将与第一行结束符组合在一起。相反，`goodStart `的两行都以换行符结尾，因此当它与`end`结合时，结果有三行，如预期的那样。

### 在字符串插值 (String Interpolation)
字符串插值是一种通过把它们的值包含在字符串字面量中，由常量、变量、字符串字面量和表达式混合构造出一个新的`String`的方法。 我们可以在单行和多行字符串文字中使用字符串插值。 我们插入到字符串字面量中的每项都需要包含在一对括号中，并加上反斜杠前缀（\）：
```
// 将一个常量或者变量的值插入到字符串中
// 字符串的插入值的方式有点像Objective-C中NSString的`stringWithFormat:`方式拼接字符串
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print("message=\(message)")
// 输出结果 message=3 times 2.5 is 7.5
```

在上面的例子中，通过`\(multiplier)`的方式，乘数的值将被插入到字符串字面量中。 当实际的字符串被创建时，该占位符将替换为乘数的实际数值。

`multiplier`的值也是字符串中表达式的一部分。 这个表达式计先算出`Double(multiplier) * 2.5`的值，并将其结果（`7.5`）插入到字符串中。 在这种情况下，当表达式被包含在字符串字面量中时，表达式需要被改写为 `\ (Double(multiplier) * 2.5)`。

我们也可以使用扩展字符串分隔符创建包含字符的字符串，让字符串中的特殊字符不具备特殊作用。例如：
```
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// 输出结果 Write an interpolated string in Swift using \(multiplier).
```

如果想在要在扩展分隔符的字符串内还要使用`\()`内的计算时，可在\后面加入`#`
```
print(#"6 times 7 is \#(6 * 7)."#)
// 输出结果 6 times 7 is 42.
```

> 注意:
在字符串插值中的括号内编写的表达式不能包含未转义的反斜杠（\）、回车符或换行符。 但是，它们可以包含在其他字符串字面量中。

### 字符编码 (Unicode )
Unicode是在不同的书写系统中对文本进行编码、表示和处理的国际标准。它使您能够以标准化的形式表示任何语言中的几乎任何字符，并可以从外部源（如文本文件或网页）读取和写入这些字符。如本节所述，swift的字符串和字符类型完全符合Unicode。

##### Unicode 标量值 (Unicode Scalar Values)
