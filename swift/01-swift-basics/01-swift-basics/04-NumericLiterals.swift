//
//  04-NumericLiterals.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

// 数字型的字面量 (Numeric Literals)
func numericLiterals01() -> Void {
    let decimalInteger = 17
    let binaryInteger = 0b10001       // 17 的二进制
    let octalInteger = 0o21           // 17 的八进制
    let hexadecimalInteger = 0x11     // 17 的十六进制
    
    print("binaryInteger=\(decimalInteger), binaryInteger=\(binaryInteger), octalInteger=\(octalInteger), hexadecimalInteger=\(hexadecimalInteger)")
    // 输出结果 binaryInteger=17, binaryInteger=17, octalInteger=17, hexadecimalInteger=17
}

// 下面的这些浮点字面量都等于十进制的12.1875：
func numericLiterals02() {
    let decimalDouble = 12.1875
    let exponentDouble = 1.21875e1
    let hexadecimalDouble = 0xC.3p0
    print("decimalDouble=\(decimalDouble), exponentDouble=\(exponentDouble), hexadecimalDouble=\(hexadecimalDouble)")
    // 输出结果 decimalDouble=12.1875, exponentDouble=12.1875, hexadecimalDouble=12.1875
}


// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
func numericLiterals03() {
    let paddedDouble = 000123.456
    let oneMillion = 1_000_000
    let justOverOneMillion = 1_000_000.000_000_1
    print("paddedDouble=\(paddedDouble), oneMillion=\(oneMillion), justOverOneMillion=\(justOverOneMillion)")
    // 输出结果 paddedDouble=123.456, oneMillion=1000000, justOverOneMillion=1000000.0000001
}


