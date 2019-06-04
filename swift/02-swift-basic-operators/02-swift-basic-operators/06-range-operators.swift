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
    // 单侧范围运算符
    let names = ["Anna", "Alex", "Brian", "Jack"]
    // `2...`，从第二个元素开始遍历，一直到最后一个元素
    for name in names[2...] {
        print("name=\(name)")
    }
    /*
     输出结果
     name=Brian
     name=Jack
     */
    
    // `...2`，取第0~2之间的范围
    for name in names[...2] {
        print("name=\(name)")
    }
    /*
     输出结果
     name=Alex
     name=Brian
     */
    
    // 半开范围运算符也有类似于单侧范围运算符的使用方式。它是从首位开始一直到限定范围前的索引，但是其并不包含限定的索引。例如：
    for name in names[..<2] {
        print("name=\(name)")
    }
    /*
     输出结果
     name=Anna
     name=Alex
     */
    
    // 单侧范围运算符不单单可以在数组的下标中使用。
    // 我们不能迭代忽略第一个值的单侧范围，因为不清楚迭代应该从哪里开始。
    // 我们可以迭代忽略其最终值的单侧范围; 但是，因为范围无限期地继续，请确保为循环添加显式结束条件。
    // 您还可以检查单侧范围是否包含特定值，如下面的代码所示：
    let range = ...5
    print(range.contains(7)) // false 7不在`...5` 的范围中
    print(range.contains(5)) // true 5 在`...5` 的范围中
    print(range.contains(4)) // true 4 在`...5` 的范围中
    print(range.contains(-1)) // true -1 在`...5` 的范围中

}
