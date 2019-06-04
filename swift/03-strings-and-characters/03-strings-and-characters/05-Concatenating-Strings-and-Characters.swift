//
//  05-Concatenating-Strings-and-Characters.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 字符串之间的拼接 (Concatenating Strings and Characters)

func concatenatingStringAndCharacters() -> Void {
    // 1.可以使用加法运算符`+`将字符串值拼接在一起，返回新的字符串值：
    let string1 = "hello"
    let string2 = " there"
    var welcome = string1 + string2
    print("welcome=\(welcome)")
    // welcome 现在等于 "hello there"
    
    // 2. 使用+=加法赋值运算符，将一个字符串拼接到现在字符串中
    var instruction = "look over"
    instruction += string2
    print("instruction=\(instruction)")
    // instruction 现在等于 "look over there"
    
    // 3. 通过append() 方法，将一个字符或字符串添加到字符串中
    let exclamationMark: Character = "!"
    welcome.append(exclamationMark)
    print("welcome=\(welcome)")
    // welcome 现在等 "hello there!"
    // 注意：不能将字符串或字符附加到现有的`Character `字符变量，因为`Character `字符类型的值只能包含一个字符。
    
    // 4. 当我们使用多行字符串时，则字符串中的每一行都要以换行符结尾，这也包括最后一行，例如：
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
}
