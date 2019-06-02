//
//  11-ErrorHandling.swift
//  01-swift-basics
//
//  Created by swae on 2019/6/2.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// 关于异常处理

/// 定义一个Sandwich(三明治)的错误枚举类型
enum SandwichError: Error {
    // 定义第一个枚举成员，表示没有干净的盘子。
    case outOfCleanDishes
    // 定义第二个枚举成员，表示缺少的成员部分而无法购买产品，同时显示缺少成员的数量。
    case missingIngredients( ingredients: Int)
}

/// 通过throws关键字抛出异常
func canThrowAnError() throws -> Void {
    // 此函数可能会或可能不会引发错误
}

func makeASandwich() throws -> Void {
    print("makeASandwich 制作三明治")
}

func eatASandwich() -> Void {
    print("eatASandwich 吃三明治")
}

// 清洗盘子
func washDishes() -> Void {
    print("washDishes 清洗盘子")
}

func buyGroceries(ingredients: Int) -> Void {
    print("购买三明治的数量：\(ingredients)")
}

func testErrorHandling() -> Void {
    // 执行canThrowAnError函数，并捕获异常
    do {
        try canThrowAnError()
        // 执行到这以后说明没有捕获到错误异常
    } catch {
        // 执行到这说明有错误异常被捕获了
    }
    
    // 以下是在错误处理中如何处理不同错误条件的示例：
    do {
        // 执行制作三明治
        try? makeASandwich()
        // 代码如果能执行到这，说明制作三明治完成，而且没有发生异常错误
        eatASandwich()
    } catch SandwichError.outOfCleanDishes {
        // 执行到这里，说明抛出了没有干净的盘子的异常
        // 调用washDishes函数开始清洗盘子
        washDishes()
    }
    catch SandwichError.missingIngredients(let ingredients) {
        // 执行到这里，说明抛出了缺少部分成员的异常，并返回了`ingredients`属性，他就是缺少的成员
        // 调用购买产品
        buyGroceries(ingredients: ingredients)
    }
    
}
