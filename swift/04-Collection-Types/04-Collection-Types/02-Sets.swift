//
//  02-Sets.swift
//  04-Collection-Types
//
//  Created by swae on 2019/6/13.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Foundation

// 集合 （Sets）
// 集合的特点是存储相同类型的不相同值，且它是顺序。 当元素的顺序不重要时，或者当我们需要确保元素仅出现一次时，就可以使用集合而不是数组。

// Creating and Initializing an Empty Set
// 创建和初始化空集合
func createSets() {
    // 1.通过构造器语法创建一个特定类型的空集合：
    // 创建一个字符集合
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    // 输出 letters is of type Set<Character> with 0 items.
    
    // 2.向集合中添加元素
    // 或者，如果上下文已经提供了类型信息，例如函数参数或已经键入的变量或常量，则可以使用空数组文字创建一个空的`Set`：
    letters.insert("a")
    // letters 现在含有1个 Character 类型的值
    letters = []
    // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型
}

// 用数组字面量创建集合
func CreatingASetWithAnArrayLiteral() {
    // 1.创建一个名为`favoriteGenres`的`Set`来存储`String`值：
    let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // favoriteGenres 被初始化为包含三个字符串元素的集合
    print("favoriteGenres: \(favoriteGenres)")
    
}

// 访问和修改集合的元素
func AccessingAndModifyingSet() -> Void {
    // 1.使用只读的`count `属性获取集合的元素个数。
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    print("favoriteGenres 的元素个数：\(favoriteGenres.count)")
    // 输出 favoriteGenres 的元素个数：3
    
    // 2.判断集合是否为空，使用`Bool`类型的`isEmpty`属性作为检查`count`属性是否等于0的快捷方式：
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    // 输出 "I have particular music preferences."
    
    // 3.添加元素到集合中，调用`Set`的`insert(_ :)`方法将新元素添加到集合中：
    favoriteGenres.insert("Jazz")
    // favoriteGenres 中现在包含4个元素
    
    // 4.移除集合中的元素，通过调用`Set`的`remove(_ :)`方法从集合中删除项目，如果该项目是该集合的成员，则删除该项目，并返回已删除的值，如果该集合不包含该项目，则返回`nil`。 或者，可以使用`removeAll()`方法删除集合中的所有元素。
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    // 输出 "Rock? I'm over it."
    
    // 5.检查集合中是否包含某个元素，使用`contains(_ :)`方法。
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
    // 输出 "It's too funky in here."
}


// 集合的迭代
func IteratingOverSet() {
    // 1.使用for-in循环遍历集合中所有元素
    let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    for genre in favoriteGenres {
        print("\(genre)")
    }
    // Rock
    // Classical
    // Hip hop
    
    // 2.Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }
    // Classical
    // Hip hop
    // Jazz
}

// 集合的基本操作
func fundamentalSetOperations() {
    /*
    - 使用`intersection(_:)`方法根据两个集合中共同的元素创建的一个新的集合。
    - 使用`symmetricDifference(_:)`方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
    - 使用`union(_:)`方法根据两个集合中所有的元素创建一个新的集合。
    - 使用`subtracting(_:)`方法将两个集合中不共有的元素创建一个新的集合。
 */
    
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    // union() 方法会把oddDigits和evenDigits这两个集合合并成一个集合
    print( oddDigits.union(evenDigits).sorted())
    //  由于使用的是Set所以合并后的集合中会去除重复元素，然后使用`sorted()`排序，注意：sorted 后返回的是数组（数组是有序的）
    // 输出结果 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    // 将两个集合中共有的元素创建为一个集合
    print(oddDigits.intersection(evenDigits).sorted())
    // 输出结果 []
    
    // 将两个集合中不共有的元素创建为一个新集合
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    // 输出结果 [1, 9]
    
    // 获取 oddDigits 中不包含singleDigitPrimeNumbers的元素，singleDigitPrimeNumbers中 不包含oddDigits的元素
    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
    // 输出结果 [1, 2, 9]
}

// 集合的成员关系和相等性（Set Membership and Equality）
func SetMembershipAndEquality() -> Void {
    /*
     - 使用“是否相等”运算符(`==`)来判断两个集合是否包含全部相同的元素。
     - 使用`isSubset(of:)`方法来判断一个集合中的元素是否也被包含在另外一个集合中。
     - 使用`isSuperset(of:)`方法来判断一个集合中包含另一个集合中所有的元素。
     - 使用`isStrictSubset(of:)`或者`isStrictSuperset(of:)`方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
     - 使用`isDisjoint(with:)`方法来判断两个集合是否不含有相同的元素(是否没有交集)。
     */
    
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    
    // 判断 houseAnimals中的元素 是否被包含在farmAnimals中
    print(houseAnimals.isSubset(of: farmAnimals))
    // true
    
    // 判断 farmAnimals 是否包含houseAnimals的所有元素
    print(farmAnimals.isSuperset(of: houseAnimals))
    // true
    
    // 判断两个集合中是否没有相同的元素
    print(farmAnimals.isDisjoint(with: cityAnimals))
    // true
}



