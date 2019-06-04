//
//  04-Working-with-Characters.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 字符的使用 (Working with Characters)

func workingWithCharacters() -> Void {
    
    // 1.使用for-in遍历字符串中的每一个字符
    for character in "Dog!" {
        print(character)
    }
    // D
    // o
    // g
    // !
    
    // 2. 创建单个字符的`Character`类型
    let exclamationMark: Character = "!"
    
    // 3. 通过String的参数为Character的数组的构造函数，初始化一个`String`类型的字符串
    let catCharacters: [Character] = ["C", "a", "t", "!"] // 数组中的每一个元素都是`Character`类型的字符
    // 通过`Character`字符数组构造一个`String`
    let catString = String(catCharacters)
    print("catString=\(catString)")
    // 输出结果 catString=Cat!
}

