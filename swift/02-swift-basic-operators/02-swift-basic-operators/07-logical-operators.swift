//
//  07-logical-operators.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 逻辑运算符 (Logical Operators)

/*
逻辑非（Logical NOT ） (`!a`)
逻辑与（Logical AND） (`a && b`)
逻辑或（Logical OR） (`a || b`)
*/

// 逻辑非运算符 Logical NOT Operator
func logicalNotOperator() -> Void {
    let allowedEntry = true
    if !allowedEntry == false {
        print("ACCESS DENIED")
    }
    // 输出结果 ACCESS DENIED
}

// 逻辑与运算符 (Logical AND Operator)
func logicalAndOperator() -> Void {
    // 此示例考虑两个`Bool`类型的值，仅当两个值都为`true`时才允许访问：
    let enteredDoorCode = true
    let passedRetinaScan = false
    if enteredDoorCode && passedRetinaScan {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出结果  ACCESS DENIED
}

// 逻辑或运算符 (Logical OR Operator)
func logicalOrOperator() -> Void {
    let hasDoorKey = false
    let knowsOverridePassword = true
    if hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    }
    else {
        print("ACCESS DENIED")
    }
    // 输出结果 Welcome!
}

// 组合逻辑运算符 (Combining Logical Operators)
func combiningLogicalOperator() -> Void {
    // 可以组合多个逻辑运算符以创建较长的复合表达式：
    let enteredDoorCode = true
    let passedRetinaScan = false
    let hasDoorKey = false
    let knowsOverridePassword = true
    if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出结果 Welcome!
}

// 使用括号来明确优先级 （Explicit Parentheses）
func explicitParentheses() -> Void {
    // 为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的。
    // 在上个关于门的权限的例子中，我们给第一个部分加个括号，使它看起来逻辑更明确：
    let enteredDoorCode = true
    let passedRetinaScan = false
    let hasDoorKey = false
    let knowsOverridePassword = true
    if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
    // 输出结果 Welcome!
}

