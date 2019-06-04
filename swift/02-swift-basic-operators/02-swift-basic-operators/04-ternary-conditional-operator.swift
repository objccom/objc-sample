//
//  04-ternary-conditional-operator.swift
//  02-swift-basic-operators
//
//  Created by xiaoyuan on 2019/6/3.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于三目运算符 (Ternary Conditional Operator)

func ternaryConditionalOperator() {
    // 三元条件运算符是下面代码的简写：
    /*
     if question {
     answer1
     } else {
     answer2
     }
     */
    
    // 1.下面是使用三目运算符计算表格行高度的示例。如果这行有标题，此行高应比内容高度高50点；如果行没有标题，则行高20点：
//    let contentHeight = 40
//    let hasHeader = true
//    let rowHeight = contentHeight + (hasHeader ? 50 : 20)
    // 输出结果 rowHeight=90
    
    // 2.上面的示例是下面示例的简写，不使用三目运算符完成计算
    let contentHeight = 40
    let hasHeader = true
    let rowHeight: Int
    if hasHeader {
        rowHeight = contentHeight + 50
    }
    else {
        rowHeight = contentHeight + 20
    }
    print("rowHeight=\(rowHeight)")
}
