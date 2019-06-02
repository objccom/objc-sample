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

/// 可选绑定
func optionalBinding() {
    
    // 使用可选绑定
//    if let <#constant name#> = <#optional#> {
//        <#statements#>
//    }
    
    let possibleNumber = "123"
    
    if var actualNumber = Int(possibleNumber) {
        print("这个字符串:\(possibleNumber) 中有一个整数：\(actualNumber)")
    } else {
        print("这个字符串:\(possibleNumber) 没有一个整数")
    }
    // 输出 这个字符串:123 中有一个整数：123
    
    // 我们还可以根据需要在单个`if`语句中包含任意多个可选绑定和布尔条件，用逗号分隔。如果可选绑定中的任何值为`nil`，或者任何布尔条件的计算结果为`false`，那么整个`if`语句的条件将被视为`false`。以下if语句是等效的：
    if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
    }
    // 输出结果 4 < 42 < 100
    
    // 隐式解析可选类型
    let possibleString: String? = "一个可选类型的字符串"
    let forcedString: String = possibleString! // 使用!强制解包进行取值
    let assumedString:String! = "隐式解析这个可选类型的字符串"
    let implicitString:String = assumedString
    
    
    // 我们仍然可以将隐式解包的可选类型视为普通的可选类型，以检查它是否包含值：
    if assumedString != nil {
        print("assumedString=\(assumedString)")
        // 输出结果 assumedString=Optional("隐式解析这个可选类型的字符串")
    }
    
    // 我们还可以使用带有可选绑定的隐式解析可选类型，在单个语句中检查和展开其值：
    if let definiteString = assumedString {
        print("definiteString=\(definiteString)")
        // 输出结果 definiteString=隐式解析这个可选类型的字符串
    }
}
