//
//  01-assignment-operator.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 赋值运算符 (Assignment Operator)

/// 赋值运算符
func assignmentOperator() -> Void {
    // 1.赋值运算符（`a = b`）用`b`值初始化或更新`a`的值：
    let b = 10
    var a = 5
    a = b
    print("a = \(a), b = \(b)")
    // 输出结果 a = 10, b = 10
    
    // 2.如果赋值预算符的右边是一个具有多个值的元组，那么它的元素可以一次分解为多个常量或变量，比如以下：
    let (x, y) = (1, 2)
    print("x = \(x), y = \(y)")
    // 输出结果 x = 1, y = 2
    
    // 3.与c语言和Objective-C语言中的赋值运算符不同，Swift中的赋值运算符本身没有返回值。所以下代码无效且无法编译用过：
//    if x = y {
//        // `if x = y`是无效的，因为`x = y`没有返回值，所以无法编译通过。
//    }
}

