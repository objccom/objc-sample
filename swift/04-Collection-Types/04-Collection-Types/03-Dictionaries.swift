//
//  03-Dictionaries.swift
//  04-Collection-Types
//
//  Created by xiaoyuan on 2019/6/14.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

/*
 字典中存储的是相同类型的key-value的容器，与Set集合相同的是字典也是无序的。 每个value与唯一的key关联，该唯一的key就是字典中该value的标识符。 与数组中的项目不同，字典中的元素没有指定的顺序。 当我们需要根据标识符查找值时，可以使用字典，这与使用真实字典查找特定单词的定义的方式非常相似。
 */

// 创建空字典
func CreatingEmptyDictionary() {
    
    // 1.创建确定类型的空字典
    var namesOfIntegers = [Int: String]()
    // 或者
//    var namesOfIntegers = Dictionary<Int, String>()
    
    // 2.如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作`[:]`（中括号中放一个冒号）：
    namesOfIntegers[16] = "sixteen"
    // namesOfIntegers 中现在包含一对键值对
    namesOfIntegers = [:]
    // namesOfIntegers再次被初始化为空字典，虽然这一次没有明确其键值对类型，但是它还是一个[Int：String]类型的空字典
}

// 使用字典字面量创建字典
func CreatingDictionaryWithDictionaryLiteral() -> Void {
    
    // 1.创建一个字典来存储国际机场的名称。 在这本词典中，`key`是三个字母的国际航空运输协会代码，`value`是机场名称：
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    // `airports`被声明为`[String：String]`类型的字典，这意味着这个字典的键和值都是String类型。
    
    // 2.和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的明确类型，那么就不必写出字典的类型。 airports字典也可以用这种简短方式定义：
//    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
}

// 访问和修改字典的元素（Accessing and Modifying a Dictionary）
func AccessingAndModifyingDictionary() -> Void {
 
    // 1.与数组一样，通过只读`count`属性查找字典中的元素个数：
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print("The airports dictionary contains \(airports.count) items.")
    // 输出 "The airports dictionary contains 2 items."
    
    // 2.使用Boolean 类型的`isEmpty`属性作为检查`count`属性是否等于0的快捷方式：
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary is not empty.")
    }
    // 输出 "The airports dictionary is not empty."
    
    // 3.使用下标语法添加一个元素到字典中。 使用适当类型的新的key作为下标索引，并指定适当类型的新值：
    airports["LHR"] = "London"
    // airports 字典中现在包含三个元素
    
    // 4.使用下标语法来改变特定键对应的值：
    airports["LHR"] = "London Heathrow"
    // "LHR" 对应的value现在被修改为"London Heathrow"
    
    // 5.作为下标的替代方法，使用字典的`updateValue(_：forKey :)`方法来设置或更新特定键的值。 与上面的下标示例一样，`updateValue(_：forKey :)`方法设置键的值（如果不存在），或者如果该键已存在则更新该值。 但是，与下标不同，`updateValue(_：forKey :)`方法在执行更新后会返回旧值。 这使您可以检查是否进行了更新。
    // `updateValue(_: forKey:)`方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。
    
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    // Prints "The old value for DUB was Dublin."
    
    // 6.使用下标语法从字典中检索特定键的值。 因为检索的键的值可能不存在，所以字典的下标返回字典值类型的可选值。 如果字典包含所请求键的值，则下标返回包含该键的现有值的可选值。 否则，下标返回nil：
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport is not in the airports dictionary.")
    }
    // 输出 "The name of the airport is Dublin Airport."
    
    // 7.使用下标语法从字典中删除某个键值对，方法是将指定键为`nil`
    airports["APL"] = "Apple International"
    // APL键值对已经被添加到字典中
    airports["APL"] = nil
    // APL对应的键值对现在已被移除
    
    // 8.使用`removeValue(forKey :)`方法从字典中删除键值对。 此方法删除键值对（如果存在）并返回已删除的值，如果不存在值，则返回nil：
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary does not contain a value for DUB.")
    }
    // 输出 "The removed airport's name is Dublin Airport."

}

// 迭代字典（Iterating Over a Dictionary）
func IteratingOverDictionary() -> Void {
    /*
     我们可以使用`for-in`循环遍历字典中的键值对。 字典中的每个项都作为`(key,value)`元组返回，并且我们可以将元组的成员分解为临时常量或变量，作为迭代的一部分：
     */
    
    // 1.使用`for-in`循环遍历字典中的键值对
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    // YYZ: Toronto Pearson
    // DUB: Dublin
    
    // 2.通过访问`keys`或者`values`属性，也可以遍历字典的键或者值：
    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }
    // Airport code: YYZ
    // Airport code: DUB
    
    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    // Airport name: Toronto Pearson
    // Airport name: Dublin
    
    // 3.如果我们需要使用带有Array实例的API的字典键或值，请使用keys或values属性初始化新数组：
    let airportCodes = [String](airports.keys)
    // airportCodes is ["LHR", "YYZ"]
    
    let airportNames = [String](airports.values)
    // airportNames is ["London Heathrow", "Toronto Pearson"]
}
