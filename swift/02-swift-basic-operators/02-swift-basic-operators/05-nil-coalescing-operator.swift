//
//  05-nil-coalescing-operator.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于nil 的聚合运算 (Nil-Coalescing Operator)

func nilCoalescingOperator() -> Void {
    
    // 1. 三目运算符实现nil 的聚合运算
    let a: Int? = 10
    let b = 20
    let c = a != nil ? a! : b
    print("c = \(c)")
    // 输出结果 c = 10
    
    // 使用`nil`合并运算符需要满足两个条件：
    /*
    `a` 必须是`Optional`（可选类型）的。
    `b` 的类型必须要和`a`解包后的值类型一致。
    */
    
    // 2. 下面的示例使用`nil`合并运算符，用户在默认颜色名称和可选定义的颜色名称之间进行选择：
    let defaultColorName = "red"
    var userDefinedColorName: String?   // 默认为nil
    var colorNameToUse = userDefinedColorName ?? defaultColorName
    print("colorNameToUse = \(colorNameToUse)")
    // 输出结果 colorNameToUse = red，因为`userDefinedColorName` 为nil, 因此`colorNameToUs`e被设置为默认的red
    
    // 当userDefinedColorName 有值时，则返回userDefinedColorName的值
    userDefinedColorName = "green"
    colorNameToUse = userDefinedColorName ?? defaultColorName
    print("colorNameToUse = \(colorNameToUse)")
    // 输出结果 colorNameToUse = green，因为`userDefinedColorName` 已经赋值为非nil的值，所以s不再返回默认值
}
