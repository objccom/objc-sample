//
//  10-Optionals.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/2.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于可选类型

func OptionalsTest01() {
    // 下面的示例使用构造函数尝试将一个`String`类型的值转换为`Int`类型：
    let possibleNumber = "123"
    let convertedNumber = Int(possibleNumber)
    // convertedNumber 被推断为 "Int?", or "optional Int"
    print("convertedNumber = \(convertedNumber!)")
    
    // 下面示例，给可选类型的变量设置为nil
    // 初始化一个可选类型的变量，在类型后面使用`?`声明一个可选类型
    var serverResponseCode: Int? = 404
    serverResponseCode = nil
    print("serverResponseCode=\(serverResponseCode)")
    // 注意
    // 使用`?`声明可选类型，使用`!`对可选类型解包
    // 如果对值为nil的可选类型变量强制解包时，在运行时会抛出异常：Fatal error: Unexpectedly found nil while unwrapping an Optional value
    // 另外， nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
    
    // 当我们声明一个可选类型的常量或者变量时，没有给其赋值，那么它自动设置为nil。
    var surveyAnswer: String?
    // surveyAnswer 被自动设置为 nil
    
}

/// 使用if语句对可选类型解包
func IfStatementsAndForcedUnwrapping() -> Void {
    
    // 当一个对象有值，它就不等于nil
    let possibleNumber = "123"
    let convertedNumber = Int(possibleNumber)
    
    if convertedNumber != nil {
        print("convertedNumber 包含一些整数的值.")
        // 通过`convertedNumber != nil`以明确确定`convertedNumber`存在非nil的值，那么我们通过`!`解包，获取这些值，这就是强制解包
        print("convertedNumber 有一个整数的值为\(convertedNumber!)")
        // 输出的结果：convertedNumber 有一个整数的值为123
    }
}
