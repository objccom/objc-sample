//
//  02-arithmetic-operators.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 算术运算符 (Arithmetic Operators)
func arithmeticOperators() -> Void {
    // 1.Swift支持所有数值类型的四个标准算术运算符：
    /*
    - 加法（`+`）
    - 减法（`-`）
    - 乘法（`*`）
    - 除法（`/`）
     */
    let add = 1 + 2  // 结果为 3
    let sub = 10 - 9 // 结果为 1
    let mult = 7 * 2 // 结果为 14
    let div = 120.8 / 20 // 结果为 6.04
    print("add = \(add)")
    print("sub = \(sub)")
    print("mult = \(mult)")
    print("div = \(div)")
    
    // 2. 通过加法运算符 对字符串进行拼接
    print("hello, " + "world")
    // 输出结果为 "hello, world"
}

// 余数预算法
func remainderOperator() {
    // 取模运算符，也叫余数运算符，（`a % b`）计算出b在a中的倍数，并返回剩余的值（称为余数）。
    /*
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
     */
    
    // 要就是那`a % b`的结果，`%`运算符将计算出余数的结果并作为返回值返回：
    /*
     a = (b x 倍数) + 余数
     */
    
    // 在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。
    print("10 % 3 = \(10 % 3), 10 % -3 = \(10 % -3)")
    // 输出结果 10 % 3 = 1, 10 % -3 = 1
}

/// 一元负号运算符
func unaryMinusOperator() {
    // 数值的符号可以使用前缀`-`即一元负号运算符进行切换：
    let three = 3
    let minusThree = -three       // minusThree 的值为 -3
    let plusThree = -minusThree   // plusThree 的值为 3
    print("three=\(three), minusThree=\(minusThree), plusThree=\(plusThree)")
    // 输出结果 three=3, minusThree=-3, plusThree=3
}

// 一元正号运算符
func unaryPlusOperator() -> Void {
    let minusSix = -6
    let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
}
