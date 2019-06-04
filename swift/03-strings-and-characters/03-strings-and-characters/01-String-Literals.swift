//
//  01-String-Literals.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 字符串常量 （String Literals）

func stringLiterals() -> Void {
    // 1.声明一个常量或变量，并使用字符串文本作为其初始化值：
    let someString = "Some string literal value"
    print("someString=\(someString)")
    // 输出 someString=Some string literal value
    
    // 2. 多行字符串文本 (Multiline String Literals)
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
    
    // 3. 多行字符串文字包含其左引号和右引号之间的所有行。
    // 字符串从左引号`(""")`后的第一行开始，到右引号前的一行结束，这意味着下面的字符串都不是以换行符开始或结束的：
    
    let singleLineString = "These are the same."
    let multilineString = """
These are the same.
"""
    print("单行字符串=\(singleLineString)")
    print("多行字符串=\(multilineString)")
    // 输出结果
    // 单行字符串=These are the same.
    // 多行字符串=These are the same.
    
    // 3. 多行字符串文本中的换行与转义符号
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
    
    // 4. 要使多行字符串以换行符开头或结尾，请将空行作为第一行或最后一行。例如：
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
    
    // 5. 多行字符串可以缩进以匹配周围的代码。
    // 结束引号` (""")`前的空格告诉Swift在所有其他行之前要忽略哪些空格。但是，如果在行首写空白，除了结束引号之前的内容外，还包括空白。
    let linesWithIndentation = """
        This line doesn't begin with whitespace.
           This line begin with four spaces.
        This line doesn't begin with whitespace.
    """
    print("linesWithIndentation=\(linesWithIndentation)")
    
    // 6.字符串中的特殊字符 （Special Characters in String Literals）
    let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
    // "Imagination is more important than knowledge" - Einstein
    let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
    let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
    let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
    print("wiseWords=\(wiseWords)")
    print("dollarSign=\(dollarSign)")
    print("blackHeart=\(blackHeart)")
    print("sparklingHeart=\(sparklingHeart)")
    /*
     输出内容
     wiseWords="Imagination is more important than knowledge" - Einstein
     dollarSign=$
     blackHeart=♥
     sparklingHeart=💖
     */
    
    // 7. 在多行字符串中，可以直接包含`”“`双引号。
    // 因为多行字符串是使用两个三双引号`""""""`，所以不必像Objective-C中那样还要使用转义字符`\`，如果在多行字符串使用`"""`，那么必须要使用至少一个转义字符
    let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
    print("threeDoubleQuotationMarks=\(threeDoubleQuotationMarks)")
    /* 输出
     threeDoubleQuotationMarks=Escaping the first quotation mark """
     Escaping all three quotation marks """
     */
    
    // 8. 字符串文本分割符
    // 我们可以将字符串放到客栈分隔符中，这样可以让字符串中的特殊字符直接显示出来，而不显示他们的效果。
    // 将字符串放在引号`""`内，并用符号`##`将其括起来。
    // 例如，打印字符串文字`#"Line 1\nLine 2"#`，打印结果中的`\n`字符本身是换行符，但是它本身被打印出来了，而并不是起到换行的左右。
    
    // 使用扩展分隔符创建的字符串文本也可以是多行字符串文本。可以使用扩展分隔符将文本`"""`包含在多行字符串中，覆盖以文本结尾的默认行为。例如：
    let threeMoreDoubleQuotationMarks = #"""
    Here are three more double quotes: """
    """#
    print("threeMoreDoubleQuotationMarks=\(threeMoreDoubleQuotationMarks)")
    
    // 将`name1`这个字符串中的子字符串`\n`显示出来，而不是对name1进行换行的效果
    let name1 = #"Line 1\nLine 2"#
    print("name1=\(name1)")
    
    // 在`##`中包含的字符也要显示换行的效果
    let name2 = #"Line 1\#nLine 2"#
    print("name2=\(name2)")
    // 注意：当我们在\和n之间写几个#号时，也要在最外面写几个#号，实际上他们的效果是一样的，比如
    let name3 = ##"Line 1\##nLine 2"##
    print("name3=\(name3)")
}
