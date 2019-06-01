//
//  08-Booleans.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/1.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于Booleans 布尔值

func booleansTes01() -> Void {
    // swift提供两个布尔常量值`true` 和 `false` 的使用
    let orangesAreOrange = true
    let turnipsAreDelicious = false
    
    // 布尔值在处理条件控制语句时非常的有用，比如
    if turnipsAreDelicious {
        print("Mmm, tasty turnips")
    }
    else {
        print("Eww, turnips are horrible.")
    }
    // 输出结果为 Eww, turnips are horrible.
    
    // 当我们在给一个`Bool`类型的变量赋值为非`Bool`类型的值时，编译器会报错，下面示例演示编译时的报错：
    let i = 1
//    if i {
//        // 这个示例无法编译通过，并且会报告错误：'Int' is not convertible to 'Bool'
//    }

    // 但是下面的示例是可以编译通过的
    if i == 1 {
        // 编译通过
    }
    
   // i == 1 的比较结果是 Bool 类型，所以第二个例子可以通过类型检查。类似 i == 1 这样的比较
}






