//
//  09-Tuples.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于元组 (tuples)
// 元组将多个值组合成一个复合值。一个元组中的值可以是任何类型，并且不必是彼此相同的类型。

/*
 在本示例中，（404，“未找到”）是一个描述HTTP状态代码的元组。
 HTTP状态代码是Web服务器在请求网页时返回的特殊值。如果您请求的网页不存在，则返回状态代码404 Not Found。
 */
func tuplesTest01() {
    // 初始化一个元组
    let http404Error = (404, "Not Found")
    print("http404Error=\(http404Error)")
    // http404Error 是一个(Int, String)类型的元组, 它的值为 (404, "Not Found")
    
    // 将元组的内容分解为单独的常量或变量，然后像往常一样访问这些常量或变量：
    // 下面将http404Error分解为statusCode, statusMessage
    let (statusCode, statusMessage) = http404Error
    print("Http 的 状态码为：\(statusCode)")
    print("Http 状态描述为：\(statusMessage)")
    
    // 如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线`(_)`标记，比如：
    // 下面只要http404Error这个元组的第一个元素的值
    let (statusCode1, _) = http404Error
    print("statusCode1=\(statusCode1)")
    // 打印结果为：statusCode1=404
    
    // 还可以通过下标获取元组的某个元素：
    print("Http 状态码为：\(http404Error.0)")
    // Http 状态码为：404
    print("Http 状态描述为：\(http404Error.1)")
    // Http 状态描述为：Not Found
    
    // 在定义元组时，可以为元组的单个元素命名：
    let http200Status = (statusCode: 200, description: "OK!")
    
    // 如果在元组中命名元素，则可以使用元素名称访问这些元素的值：
    print("状态码是 \(http200Status.statusCode)")
    // 输出 状态码是 200
    print("状态描述为 \(http200Status.description)")
    // 输出 状态描述为 OK!
}

