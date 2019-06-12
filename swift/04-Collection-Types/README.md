### 简介
Swift提供了三种主要的集合类型，即数组、集合和字典，用于存储值集合：

- 1.数组（Arrays）是值的有序集合。
- 2.集合（Sets）是唯一值的无序集合。
- 3.字典（Dictionaries）是键值关联的无序集合。

![CollectionTypes_intro_2x.png](https://static.kuwe.top/2019/6/sGzb2blGLvOyFy9X3jv1a9LNEmTSKufxfAsYDTPEUViqkik61gPwN1Z0CKJqCFL3 "CollectionTypes_intro_2x.png")

Swift中的数组、集合和字典中存储的数据值类型必须明确。这意味着我们不正确地类型的值插入到集合中。它还意味着我们可以确信将从集合中检索的值的类型。

> 注意
swift的数组、集合和字典类型实现为泛型集合。有关泛型类型和集合的详细信息，请参见[泛型](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)。

### 集合的可变性 （Mutability of Collections）
- 1.可变集合，如果创建数组、集合或字典，将其赋值给声明的`var`变量，则创建的集合将是可变的。这意味着我们可以在创建集合之后通过添加、删除或更改集合中的项来更改（或改变）该集合。
- 2.不可变集合，如果将数组、集合或字典赋给`let`常量，则该集合是不可变的，其大小和内容不能更改。

> 注意
在不需要更改集合的所有情况下，最好创建不可变集合。这样做可以更容易地解释代码，并使swift编译器能够优化您创建的集合的性能。

### 数组 （Arrays）
数组是在一个有序列表中存储相同类型的值。这些相同的值可以在一个数组中的不同位置多次出现。

