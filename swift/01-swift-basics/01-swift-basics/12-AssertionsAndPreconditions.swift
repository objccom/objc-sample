//
//  12-AssertionsAndPreconditions.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/2.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 用断言调试
func DebuggingWithAssertions() -> Void {
    
    let age = -3
    assert(age >= 0, "一个人的年龄不能小于0岁")
    // Assertion failed: 一个人的年龄不能小于0岁

    // 我们还可以省略断言的信息
    assert(age >= 0)

    // 如果代码已经检查了条件，您可以使用[`assertionFailure(_:file:line:)`(https://developer.apple.com/documentation/swift/1539616-assertionfailure)]函数来指示断言失败。例如：
    if age > 10 {
         print("你可以坐过山车或摩天轮。")
    }
    else if age >= 0 {
        print("你可以骑摩天轮。")
    }
    else {
        assertionFailure("一个人的年龄不能小于0岁")
    }
    
    // In the implementation of a subscript...
    let index = 0
    precondition(index > 0, "Index 必须大于0")
    // Thread 1: Precondition failed: Index 必须大于0
}
