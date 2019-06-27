# SwiftUI 给视图设置动画和和转场（Animating Views and Transitions）

本章节来自[Apple SwiftUI Tutorials Animating Views and Transitions](https://developer.apple.com/tutorials/swiftui/animating-views-and-transitions)

### 简介
使用SwiftUI时，无论效果怎么样，我们都可以单独为视图添加动画，或者对视图状态进行动画处理。 SwiftUI为我们处理这些组合，重叠和可中断动画的所有复杂性。

在本教程中，我们将为包含图表的视图设置动画，以记录用户在使用`Landmark`应用时所做的喜好。 使用`animation(_:) `方法为视图设置动画非常简单。

[下载本项目](https://docs-assets.developer.apple.com/published/ef7f3732f1/ComposingComplexInterfaces.zip)并按照本教程进行操作，或打开已完成的项目并自行探索代码。


### 第1节 将动画添加到单个视图（Add Animations to Individual Views）
当我们给一个`View`使用`animation（_ :)`方法时，`SwiftUI`动画的任何变化都会改变视野的动画性能。 视图的`color`（颜色），`opacity`（不透明度），`rotation`（旋转），`size`（大小）和其他属性都是可以使用动画效果的。

![87e61b94-0b70-479c-af0b-b22f65f66d04.png](https://static.kuwe.top/2019/6/0bTrClfeP0AGmpg8JgCJEW6dy4kARXvTRApX6GFoPNbTCXfU5yTMOmrGQbS3lv20 "87e61b94-0b70-479c-af0b-b22f65f66d04.png")


##### 步骤1
在项目菜单中选中`HikeView.swift`，打开实时预览并尝试显示和隐藏图形。
