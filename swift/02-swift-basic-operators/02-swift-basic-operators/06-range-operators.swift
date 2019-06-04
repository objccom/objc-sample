//
//  06-range-operators.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 范围运算符 (Range Operators)

/// 闭合运算符(Closed Range Operator)
func closedRangeOperator() -> Void {
    for index in 0...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    /*输出
     0 times 5 is 0
     1 times 5 is 5
     2 times 5 is 10
     3 times 5 is 15
     4 times 5 is 20
     5 times 5 is 25
     */
}

/// 半开范围运算符
func halfOpenRangeOperator() -> Void {
    /*
     半开范围运算符定义了从`a`到`b`的范围，但不包括`b`。
     因为它包含其第一个值，但不包含其最终值，所以说它是半开的。
     与闭合范围运算符一样，`a`的值不能大于`b`。如果`a`的值等于`b`，则结果范围将为空。
     */
    
    let names = ["Anna", "Alex", "Brian", "Jack"]
    let count = names.count
    for index in 0..<count {
        print("这个人的名字是: \(names[index])")
    }
    /*
     输出结果：
     这个人的名字是: Anna
     这个人的名字是: Alex
     这个人的名字是: Brian
     这个人的名字是: Jack
     */
}

/// 单侧范围运算符
func oneSidedRanges() -> Void {
    
}
