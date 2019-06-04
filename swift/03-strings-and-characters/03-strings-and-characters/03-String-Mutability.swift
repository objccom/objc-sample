//
//  03-String-Mutability.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 可变字符串 (String Mutability)

func StringMutability() -> Void {
    //  我们需要通过`var`定义一个变量来表明一个特定的字符串能被修改，或者通过`let`定义一个常量来表明它不能被修改。
    
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
}
