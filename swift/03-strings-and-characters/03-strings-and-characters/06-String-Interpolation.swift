//
//  06-String-Interpolation.swift
//  03-strings-and-characters
//
//  Created by xiaoyuan on 2019/6/4.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

// 关于 字符串插值 (String Interpolation)

func stringInterpolation() -> Void {
    // 1.将一个常量或者变量的值插入到字符串中
    // 字符串的插入值的方式有点像Objective-C中NSString的`stringWithFormat:`方式拼接字符串
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    print("message=\(message)")
    // 输出结果 message=3 times 2.5 is 7.5
    
    // 2.我们也可以使用扩展字符串分隔符创建包含字符的字符串，让字符串中的特殊字符不具备特殊作用，这样`\()`内的变量就只是普通的字符串显示。例如：
    print(#"Write an interpolated string in Swift using \(multiplier)."#)
    // 输出结果 Write an interpolated string in Swift using \(multiplier).
    
    // 3. 如果想在要在扩展分隔符的字符串内还要使用`\()`内的计算时，可在`\`后面加入`#`
    print(#"6 times 7 is \#(6 * 7)."#)
    // 输出结果 6 times 7 is 42.
}
