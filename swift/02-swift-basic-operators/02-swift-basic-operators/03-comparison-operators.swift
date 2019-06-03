//
//  03-comparison-operators.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 比较预算法 (Comparison Operators)

/*
每个比较运算符都有一个`Bool`类型的返回值，以表示该语句的结果是否为`true`
比较运算符通常用于条件判断语句，例如`if`语句：
 */


func comparisonOperators() -> Void {
    
    // 1. 了解比较运算符之==
    let name = "world"
    if name == "world" {
        print("hello world.")
    }
    else {
        print("I'm sorry \(name), but I don't recognize you")
    }
    // 输出结果 hello world.
    
    // 2. 使用比较运算符比较两个元祖的大小
    /*
如果两个元组具有可比较性（比如两个元组中有相同的类型和值的数量），那么我们也可以比较运算符比较它们。元组遵循从左到右进行比较，每次比较一个值，直到比较找到两个不相等的值。对这两个值进行比较，比较的结果决定了元组比较的总体结果。如果所有元素都相等，那么元组本身就相等。例如：
     */
    let flag = (1, "zebra") < (2, "apple") // true 这两个元组的第一个元素 1 小于 2，第二个元素"zebra" 和 "apple" 没有比较，所以以第一个元素的比较结果为这两个元组的比较结果
    let flag1 = (3, "apple") < (3, "bird") // true 因为这两个元组的第一个元素 3 相等，并且“apple" 小于 "bird"(比较字母)，所以按照第二个元素的比较结果为这两个元组的比较结果
    let flag2 = (4, "dog") == (4, "dog") // true 这两个元素的两个元素都是相同的，所以这两个元组相同
    print("flag=\(flag), flag1=\(flag1), flag2\(flag2)")
    // 输出结果 flag=true, flag1=true, flag2true
    
    // 3. 元组中的`Bool`类型不能用使用比较运算符比较
    /*
    只有当运算符可以应用于各自元组中的每个值时，才能将元组与给定的运算符进行比较。例如，如下面的代码所示，可以比较两个类型`(String, Int)`的元组，因为可以使用`<`运算符比较`String`和`Int`的值。相反，两个类型`(String, Bool)`的元组不能与`<`运算符进行比较，因为`<`运算符不能应用于`Bool`值。
     */
   let flag3 = ("blue", -1) < ("purple", 1) // 可以比较
//    ("blue", false) < ("purple", true)  // 不可以比较，因为`<`小于比较运算符不适用于布尔值之间的比较，所有无法编译通过，编译错误：`Binary operator '<' cannot be applied to two '(String, Bool)' operands`
    
    /*
     > 注意：
     Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。
     */
}
