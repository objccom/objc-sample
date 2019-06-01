//
//  01-ConstantsAndVariables.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// Constants and Variables （常量和变量）

/// 定义常量和变量
func declaringConstantsAndVariables() -> Void {
    // 声明一个名为maximumNumberOfLoginAttempts的新常量，并将其值设为10，常量的值不能修改
    let maximumNumberOfLoginAttempts = 10
    // 声明一个名为currentloginatempt的新变量，并给它一个初始值0。
    var currentLoginAttempt = 0
    // 变量的值可以修改
    currentLoginAttempt = 100
    print("maximumNumberOfLoginAttempts:\(maximumNumberOfLoginAttempts)")
    print("currentLoginAttempt\(currentLoginAttempt)")
    
    // 在一行中声明多个常量或多个变量，并初始化，注意对个需用逗号分隔：
    var x = 0.0, y = 10.0, z = 20.0
    // 修改变量的值
    x = 99.8
    y = 321.9
    z = 119.9
    // 打印结果
    print("x=\(x), y=\(y), z=\(z)")
}

/// 对变量或常量进行类型注解，以明确其存储的数据类型
func typeAnnotations() -> Void {
    // 声明一个String类型的welcomeMessage变量
    var welcomeMessage: String
    // 给welcomeMessage变量赋值
    welcomeMessage = "hello world."
    print(welcomeMessage)
    
    // 在一行中声明多个常量或多个变量，并使用类型注解，以明确这些变量存储的数据类型，注意对个需用逗号分隔：
    // 声明三个类型为Double的变量
    var red, blue, green: Double
    // 给这三个变量赋值
    red = 100.0
    blue = 180.0
    green = 255.0
    // 打印结果
    print("red=\(red), blue=\(blue), green=\(green)")
    
}

/// 常量和变量的命名
func namingConstantsAndVariables() -> Void {
    /// 在未常量和变量命名时，我们几乎可以使用任何字符，包括Unicode字符：
    let π = 3.14159
    let 你好 = "你好世界"
    let 🐶🐮 = "dogcow"
    print("\(π), \(你好), \(🐶🐮)")
}
