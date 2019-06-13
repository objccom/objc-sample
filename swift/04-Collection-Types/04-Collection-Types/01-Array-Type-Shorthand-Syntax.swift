//
//  01-Array-Type-Shorthand-Syntax.swift
//  04-Collection-Types
//
//  Created by xiaoyuan on 2019/6/13.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/// swift 中 Array 数组的速记语法 （ Array Type Shorthand Syntax）

// 创建数组的方法
func arrayTypeShorthandSyntax() -> Void {
    
    // 1.数组的第一种写法
    // 使用Array的初始化语法创建一个空的数组
    var array1 = Array<Int>()
    print("array1 is of type [Int] with \(array1.count) items.")
    // 输出结果 array1 is of type [Int] with 0 items.
    // 给数组中添加一个元素1
    array1.append(1)
    // 现在array1 中有一个值为1的Int类型
    
    array1 = []
    // array1被重新赋值，它现在是一个空数组，但仍然是[Int]类型
    
    // 2.数组的第二种写法
    let array2 = [2, 3]
    
    // 3.创建有默认值的数组
    // 创建具有3个元素同为0.0的[Double]类型的数组
    var threeDoubles = Array(repeating: 0.0, count: 3)
    // threeDoubles的类型为[Double]，等于[0.0,0.0,0.0]
    
    // 4.通过两个数组相加创建一个数组
    var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    // anotherThreeDoubles的类型为[Double]，等于[2.5, 2.5, 2.5]
    
    var sixDoubles = threeDoubles + anotherThreeDoubles
    // sixDoubles 被推断为[Double]，等于[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
    
    // 5.用数组字面量构造数组
    var shoppingList: [String] = ["Eggs", "Milk"]
    // shoppingList 被初始化为具有两个元素的[String]数组
    
    
}

// 访问和修改数组的元素
func accessingAndModifyingAnArray() {
    
    var shoppingList: [String] = ["Eggs", "Milk"]
    
    // 1.获取数组元素的个数
    print("shoppingList 这个数组包含 \(shoppingList.count) 个元素.")
    // 打印结果 shoppingList 这个数组包含 2 个元素.
    
    // 2.使用返回值为`Boolean `的`isEmpty`属性作为检查一个数组的`count`属性是否等于`0`的快捷方式：
    if shoppingList.isEmpty {
        print("shoppingList 为空")
    }
    else {
        print("shoppingList 不为空")
    }
    // 打印结果 shoppingList 为空
    
    // 3.我们可以调用数组的`append(_:) `方法，向数组的末尾添加一个元素：
    shoppingList.append("Flour")
    // shoppingList 现在包含三个元素，最后一个元素为Flour
    
    // 4.使用`+=`运算符，向数组的末尾追加一个相同类型的数组
    shoppingList += ["Baking Powder"]
    // shoppingList 数组中现在包含4个元素
    
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    // shoppingList 数组中现在包含7个元素
    
    // 5.使用下标语法从数组中检索值，在数组名称后面的方括号内传递要检索的值的索引：
    var firstItem = shoppingList[0]
    // firstItem 的值为 Eggs
    
    // 6.通过下标语法修改数组中已存在的某个索引的值
    shoppingList[0] = "Six eggs"
    // 现在数组中第0个元素的值为Six eggs 而不是Eggs
    
    // 使用下标语法时，必须要防止下标越界。 例如，`shoppingList[shoppingList.count] =“Salt”`数组越界操作，会发送运行时错误。
    
    // 7.使用下标修改某个数组中某个范围的值
    // 我们还可以使用下标语法一次更改数组某个范围的值，即使替换值集的长度与要替换的范围不同。 以下示例将“Chocolate Spread”，“Cheese”和“Butter”替换为“Bananas”和“Apples”：
    shoppingList[4...6] = ["Bananas", "Apples"]
    // 现在数组中包含6个元素
    print(shoppingList)
    
    // 8.要在数组的指定索引处插入有效的值，请调用数组的`insert(_：at :)`方法：
    shoppingList.insert("Maple Syrup", at: 0)
    // 现在数组中包含7个元素，首个元素为Maple Syrup
    
    // 调用insert(_:at:)方法把值为"Maple Syrup"的新数据项插入列表的最开始位置，并且使用0作为索引值。
    
    // 9.根据索引删除数组中的元素。
    // 同样，我们使用`remove(at :)`方法从数组中删除项目。 此方法删除指定索引处的元素，并返回已删除的元素（如果我们不需要这个返回值，可以忽略它）：
    var removedItem = shoppingList.remove(at: 0)
    // 从数组中的第0个元素被移除掉
    print("移除的元素为 \(removedItem)")
    // 移除的元素为 Maple Syrup
    
    /*
     注意
     如果尝试访问或修改数组以外的索引，则会触发运行时错误。我们可以在使用之前，可以使用索引与`count`属性比较，以检查这个索引是否越界。 因为数组从零开始索引，所以数组中最大的有效索引是`count-1`，  但是，当count为0（表示数组为空）时，没有有效的索引。
     */
    
    // 10.删除项目时，数组中的任何间隙都会关闭，因此索引0处的值再次等于“Six eggs”：
    firstItem = shoppingList[0]
    print("firstItem 是 \(firstItem)")
    // 打印结果 firstItem 是 Six eggs
    
    // 11.删除数组中末尾的元素：
    // 我们可以使用`removeLast()`方法，从数组中删除最后一个元素，最好不要使用`remove(at :)`方法，以避免需要查询数组的count属性。 `remove(at :)`和`removeLast()`方法一样，返回值都是已删除的元素：
    removedItem = shoppingList.removeLast()
    // 数组中最后一个元素被删除了，现在只有5个元素
    print("removedItem 是 \(removedItem)")
    // 打印结果 removedItem 是 Apples
}

// 迭代数组
func iteratingOverAnArray() -> Void {
    // 1.使用`for-in`循环遍历数组中的所有元素：
    var shoppingList = ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]
    for item in shoppingList {
        print("item == \(item)")
    }
    /*
     输出结果
     item == Six eggs
     item == Milk
     item == Flour
     item == Baking Powder
     item == Bananas
     */
    
    // 2.使用`enumerated()`方法迭代数组
    // 如果迭代数组时，需要同时使用元素的索引和值，请使用`enumerated()`方法迭代数组。 对于数组中的每个元素，`enumerated()`方法返回由整数和元素组成的元组。我们可以将元组分解为临时常量或变量，作为迭代的一部分：
    
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index): \(value)")
    }
    /*
     输出结果
     Item 0: Six eggs
     Item 1: Milk
     Item 2: Flour
     Item 3: Baking Powder
     Item 4: Bananas
     */
}
