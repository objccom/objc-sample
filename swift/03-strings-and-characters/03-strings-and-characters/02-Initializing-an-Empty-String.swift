//
//  02-Initializing-an-Empty-String.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 初始化一个空字符串 (Initializing an Empty String)


func InitializingAnEmptyString() -> Void {
    // 要创建一个空字符串值作为生成较长字符串的起点，请为变量分配一个空字符串文字，或使用初始值设定项语法初始化一个新的字符串实例：
    
    // 创建空串
    var emptyString = "" // 初始化一个空的文本字符串
    var anthorEmptyString = String() // 使用String 的初始化方法初始
    // 这两个方法初始化的字符串都是空串，且都是相同的
    
    if emptyString.isEmpty {
        print("emptyString 是空字符串")
    }
    // 输出结果 emptyString 是空字符串
}
