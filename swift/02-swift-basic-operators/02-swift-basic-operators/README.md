翻译自[swift.org](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)

### 简介
字符串是由一系列字符，如“hello, world”或“albatross ”。Swift中的字符串是`String`类型。除了 `String` 类型外，还多一种 `Character`（C语言中称之为 `Char`，叫做字符类型）类型，字符串的内容可以通过多种方式访问，包括作为`Character `的值的集合访问。

Swift的`String`和`Character `类型提供了一种快速、符合Unicode的方式来处理代码中的文本。字符串的创建和操作的语法是轻量级和易读的，字符串文字语法类似于C语言。字符串连接的连接可以通过`+`运算符简单的完成。声明字符串时通过`let`常量表明是不可变字符串，通过`var`变量声明一个可变字符串，就像swift中的任何其他值一样。也可以使用字符串将常量、变量、文本和表达式插入较长的字符串中，这一过程称为字符串插值。这使得为显示、存储和打印创建自定义字符串值变得容易。

swift中的`String` 类型是一种快速、现代化的字符串实现，每一个字符串都是由编码无关的 Unicode 字符组成，并支持访问字符的多种Unicode表达形式。

> 注意
我们可以用`Foundation`，实现swift中的`String`与`NSString` 进行桥接。`Foundation`还扩展了`NSString`中定义的方法。这意味着，如果导入`Foundation`，则可以在不转换的情况下让`String`类型的字符串访问`NSString`中定义的方法。
有关将`String`与`Foundation`和`Cocoa`一起使用的更多信息，请参阅[`String`和`NSString`之间的桥接](https://developer.apple.com/documentation/swift/string#2919514)。

### 字符串常量 (String Literals)
