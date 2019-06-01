//
//  07-TypeAliases.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于类型别名

// 当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数据：

// 给UInt16起一个别名为AudioSample
typealias AudioSample = UInt16

// 使用别名
// 定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名：
var maxAmplitudeFound = AudioSample.max

