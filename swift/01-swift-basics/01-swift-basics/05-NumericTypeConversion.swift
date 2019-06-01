//
//  05-NumericTypeConversion.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于数字类型之间的转换

/// 整数之间的转换
func IntegerConversion() -> Void {
    // 以下演示超出整数可表达的范围错误
    
//    let cannotBeNegative: UInt8 = -1
//    // UInt8不能存储负数，因此编译时出错：Negative integer '-1' overflows when stored into unsigned type 'UInt8'
//    let tooBig: Int8 = Int8.max + 1
//    // Int8不能存储大于它最大值的数字， 因此编译时出错：Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
    
    // 类型转换
    let twoThousand: UInt16 = 2_000
    let one: UInt8  = 1
    let twoThousandAndOne = twoThousand + UInt16(one)
    print("twoThousandAndOne=\(twoThousandAndOne)")
}

/// 整型和浮点型之间的转换
func IntegerAndFloatingPointConversion() -> Void {
    // 整数和浮点数之间必须显式转换类型
    
    let three = 3
    let pointOneFourOneFiveNine = 0.14159
    let pi = Double(three) + pointOneFourOneFiveNine
    print("pi=\(pi)")
    // pi的值为3.14159，其类型被自动推断为Double类型
    
    let integerPi = Int(pi)
    print("integerPi=\(integerPi)")
    // integerPi 的值为3，并且被类型推断为Int类型
    
}

