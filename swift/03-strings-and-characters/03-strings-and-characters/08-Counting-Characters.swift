//
//  08-Counting-Characters.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/5.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 计数字符 Counting Characters

// 我们可以使用`String`类型字符串的`count`属性获取字符串的字符长度

func countingCharacters() -> Void {
    // 1.计算字符串中的字符数量
    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
    print("unusualMenagerie 有\(unusualMenagerie.count) 个字符")
    // 输出 unusualMenagerie 有40 个字符
    
    // 2. 注意，Swift对于`Character`值使用扩展字形集合意味着字符串连接和修改可能不会影响字符串的字符数。
    // 例如，如果我们使用四个字母的单词`cafe` 来初始化一个新的字符串，
    // 然后将一个组合`ACUTE ACCENT`（`U+0301`）附加到字符串的末尾，
    // 则生成的字符串仍将具有`4`的字符数，那么`cafe`的第四个字母会变成是 `é`，而不是`e`：
    var word = "cafe"
    print("\(word) 这个单词的字符长度是 \(word.count) 个")
    // 输出 cafe 这个单词的字符长度是 4 个
    // 然后将一个组合`ACUTE ACCENT`的（`U+0301`）附加到字符串的末尾，
    word += "\u{301}"
    print("\(word) 这个单词的字符长度是 \(word.count) 个")
    // 输出 café 这个单词的字符长度是 4 个
    
}
