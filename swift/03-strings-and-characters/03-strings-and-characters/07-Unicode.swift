//
//  07-Unicode.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/5.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于 String 的 Unicode 字符编码

// 扩展字符集群 (Extended Grapheme Clusters)
func extendedGraphemeClusters() -> Void {
    // Swift中`Character`类型的每个字符实例都代表一个扩展字符集群。
    // 扩展字符集群是一个或多个Unicode标量的序列，这些标量（组合在一起）产生一个人类可读的字符。
    let eAcute: Character =  "\u{E9}"                      // é
    let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
    print("eAcute=\(eAcute), combinedEAcute=\(combinedEAcute)")
    // 输出 eAcute=é, combinedEAcute=é
    
    // 扩展字符集群是将许多复杂的脚本字符表示为单个字符值的灵活方法。
    // 例如，朝鲜字母表中的韩文音节可以
    let precomposed: Character = "\u{D55C}"                  // 한
    let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
    print("precomposed=\(precomposed), decomposed=\(decomposed)")
    // 输出 precomposed=한, decomposed=한
    
    // 扩展字形集合包含标记的标量（如`COMBINING ENCLOSING CIRCLE`或`U+20DD`）可以将其他Unicode标量作为单个字符值的一部分：
    let enclosedEAcute: Character = "\u{E9}\u{20DD}"
    print("enclosedEAcute=\(enclosedEAcute)")
    // 输出 enclosedEAcute=é⃝
    
    // 用作区域指示符的Unicode标量可以成对组合以形成单个字符值，
    // 例如区域指示符符号U(REGIONAL INDICATOR SYMBOL LETTER U)（U+1F1FA）和区域指示符号表S(REGIONAL INDICATOR SYMBOL LETTER S) （U+1F1F8）的组合：
    let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
    print("regionalIndicatorForUS = \(regionalIndicatorForUS)")
   // 输出 regionalIndicatorForUS = 🇺🇸
}
