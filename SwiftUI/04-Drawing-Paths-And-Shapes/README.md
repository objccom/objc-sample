# 绘画和动画-绘制路线和形状（Drawing Paths and Shapes）

本章节来自[Apple SwiftUI Tutorials Drawing Paths and Shapes]( https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes)

### 简介
用户从landmark列表进入详情时会收到一个badge。 
我们现在需要创建badge。 本教程将指导我们通过组合路径和形状来创建badge的过程，然后将其与另一个表示位置的形状重叠。

如果要为不同类型的landmark创建多个badge，请尝试使用覆盖的符号、更改重复的数量或更改不同的角度和比例。

按照步骤构建此项目，或者下载完成的项目以自行探索。[下载项目](https://docs-assets.developer.apple.com/published/4d231ba0d7/DrawingPathsAndShapes.zip)


### 第1节 创建徽章视图（Create a Badge View）
要创建徽章，首先要创建一个使用`SwiftUI`中的矢量绘图API的徽章视图。

![1eaa6ce0-029f-467e-9d19-0852fcdadb35.png](https://static.kuwe.top/2019/6/Ckjn1LHCoLwdCMmDmERVF4OZa8oIQlO6R8DlHRE5RSdUzxsWMptH0tVReBvsegmG "1eaa6ce0-029f-467e-9d19-0852fcdadb35.png")

##### 步骤1
选择`File`>`New`>`File`，然后从“iOS模板”表中选择`SwiftUI View`。 单击`Next`继续，然后在“另存为”字段中输入`Badge`，并单击`Create`。

##### 步骤2
修改`Badge`视图中`Text`默认的文本为`Badge`，然后通过预览画布可以看到显示为`Badge`文本。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        Text("Badge")
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
```

### 第二节 绘制徽章背景（Draw the Badge Background）
使用SwiftUI中的图形API绘制自定义徽章形状。

![158234bf-5a98-4d64-8fc0-7d685f419453.png](https://static.kuwe.top/2019/6/XdjUBxxfILR17Nun8LbrSzgU9ET4XZw6g9GvHTRonJPCTeb44qZFvkYDSOGPbfLe "158234bf-5a98-4d64-8fc0-7d685f419453.png")


##### 步骤1 示例代码在HexagonParameters.swift文件中。
`HexagonParameters`结构体定义了绘制徽章的六边形形状的细节。 我们不对这个结构体进行修改，我们将使用它来指定用于绘制徽章的线条和曲线的控制点。

```swift
import SwiftUI

struct HexagonParameters {
    struct Segment {
        let useWidth: (CGFloat, CGFloat, CGFloat)
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let useHeight: (CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    
    static let adjustment: CGFloat = 0.085
    static let points = [
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.60, 0.40, 0.50),
            useHeight: (1.00, 1.00, 0.00),
            yFactors:  (0.05, 0.05, 0.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.05, 0.00, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.20 + adjustment, 0.30 + adjustment, 0.25 + adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.00, 0.05, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.70 - adjustment, 0.80 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.40, 0.60, 0.50),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.95, 0.95, 1.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.95, 1.00, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.80 - adjustment, 0.70 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (1.00, 0.95, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.30 + adjustment, 0.20 + adjustment, 0.25 + adjustment)
        )
    ]
}

```

##### 步骤2
在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
        Path { path in
            
        }
        .fill(Color.black)
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif

```

我们可以使用路径组合线条，曲线和其他绘图基元，以形成更复杂的形状，如徽章的六边形背景。


##### 步骤3 在路径中添加起点。
执行`move(to :)`方法将绘图光标移动到一个形状的边界内，好像假想的钢笔或铅笔悬停在该区域上，等待开始绘制。

```swift

import SwiftUI

struct Badge: View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(to: CGPoint(x: width * 0.95, y: height * 0.20))
        }
        .fill(Color.black)
    }
}

#if DEBUG
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
```

##### 步骤4 
绘制形状数据的每个点的线条以创建粗糙的六边形形状。

![屏幕快照2019-06-14下午6.21.22.png](https://static.kuwe.top/2019/6/c2fBFTSUdCK6ZL1Y7eZWyzWs4rx4QzSCFwgfTDUOQ0ybA3XBVGPgj4SZgbwfBC3O "屏幕快照2019-06-14下午6.21.22.png")

`addLine(to :)`方法占用一个点并绘制它。 连续调用`addLine(to :)`在前一点开始一行并继续到新点。


不要担心我们的六角形看起来有点不寻常; 现在只是预期行为。 在接下来的几个步骤中，我们将努力使六边形看起来更像本节开头所示的徽章形状。

##### 步骤
使用`addQuadCurve(to：control :)`方法绘制徽章角的Bézier(贝塞尔)曲线。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(
                to: CGPoint(
                    x: width*0.95,
                    y: height*(0.20 + HexagonParameters.adjustment)
                )
            )
            
            HexagonParameters.points.forEach {
                path.addLine(
                    to: .init(
                        x: width * $0.useWidth.0 * $0.xFactors.0,
                        y: height * $0.useHeight.0 * $0.yFactors.0
                    )
                )
                path.addQuadCurve(
                    to: .init(
                        x: width * $0.useWidth.1 * $0.xFactors.1,
                        y: height * $0.useHeight.1 * $0.yFactors.1
                    ), control: .init(
                        x: width * $0.useWidth.2 * $0.xFactors.2,
                        y: height * $0.useHeight.2 * $0.yFactors.2
                    )
                )
            }
        }
        .fill(Color.black)
        
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif

```



##### 步骤6
将徽章path放在在GeometryReader中，以便徽章可以使用其包含视图的大小，该视图定义大小而不是对值进行硬编码（100）。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        
        GeometryReader { geometry in
            
            // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                path.move(
                    to: CGPoint(
                        x: width*0.95,
                        y: height*(0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
            .fill(Color.black)
        }
        
        
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif

```

使用最小的几何体的两个维度可以在徽章的包含视图不是正方形时保留纵横比。

##### 步骤7 使用`xScale`和`xOffset`调整变量将徽章置于其几何体中心。

##### 步骤8 使用渐变替换徽章的纯黑色背景以匹配设计。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        
        GeometryReader { geometry in
            
            // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
                // 使用渐变替换徽章的纯黑色背景以匹配设计。
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ))
            
        }
        
        
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
```

##### 步骤9 将`aspectRatio(_：contentMode :)`修饰符应用于渐变填充。

```swift
import SwiftUI

struct Badge : View {
    var body: some View {
        
        GeometryReader { geometry in
            
            // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
                // 使用渐变替换徽章的纯黑色背景以匹配设计。
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ))
            .aspectRatio(1, contentMode: .fit)
            
        }
        
        
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
```

通过保持1：1的宽高比，徽章保持其位于视图中心的位置，即使其父视图不是正方形。

### 绘制徽章符号（Draw the Badge Symbol）
“地标”徽章的中心有一个自定义标志，该标志基于出现在“地标”应用程序图标中的山。

山脉符号由两个形状组成：一个代表峰顶的雪盖，另一个代表沿着进近的植被。 你将使用两个部分三角形的形状绘制它们，这些形状由一个小间隙分开。


##### 步骤1
对`Badge`视图的主体分解并进行封装，创建名为`BadgeBackground.swift`的新文件中的新`BadgeBackground`视图，将`Badge`中`body`中的内容封装为`BadgeBackground`视图，作为为其他视图准备`Badge`视图的方法。

```swift
BadgeBackground.swift

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
            .aspectRatio(1, contentMode: .fit)
        }
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#if DEBUG
struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
#endif
```


##### 步骤2
在步骤1中我们将`Badge`的`body`中的视图封装`BadgeBackground`了，现在将`BadgeBackground`视图放置`Badge`视图的`body`中，以在`Badge`中显示`BadgeBackground`。

```swift
Badge.swift
import SwiftUI

struct Badge: View {
    var body: some View {
        BadgeBackground()
    }
}

#if DEBUG
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
```

##### 步骤3
为徽章设计中以旋转图案标记的山形创建名为`BadgeSymbol`的新自定义视图。

```swift
//
//  BadgeSymbol.swift
//  04-Drawing-Paths-And-Shapes
//
//  Created by swae on 2019/6/15.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct BadgeSymbol : View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

#if DEBUG
struct BadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
#endif

```

##### 步骤4
使用路径API绘制符号的顶部。

![Snip20190615_2.png](https://static.kuwe.top/2019/6/7JGRAnN4hl6mFY2rUleKKnNt9yXWPW5G2peuoGZ4vqvZH1CgAx0V7HGYdPSOTGRo "Snip20190615_2.png")

实验
尝试调整与`spacing`，`topWidth`和`topHeight`常量关联的数字乘数，以了解它们如何影响整体形状。

```swift
//
//  BadgeSymbol.swift
//  04-Drawing-Paths-And-Shapes
//
//  Created by swae on 2019/6/15.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct BadgeSymbol : View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                    ])
            }
        }
    }
}

#if DEBUG
struct BadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
#endif

```

##### 步骤5
第5步
绘制符号的底部。
使用`move(to :)`修饰符在同一路径中的多个形状之间插入间隙。

![Snip20190615_3.png](https://static.kuwe.top/2019/6/o22zDgeZ5q1A0tSfTP54ibYDgZ02awMtiAQA3R4U7z1RA4PZlrrRdzrYJ0BzgYGD "Snip20190615_3.png")

##### 步骤6
使用设计中的紫色填充符号。

![Snip20190615_4.png](https://static.kuwe.top/2019/6/wU7Tjn9FbBR0JdvoMzcca7UlEbQyg0on2TknxANLx0mA2UtHN8iRLxExBvGkwurp "Snip20190615_4.png")

### 第4节 组合徽章前景和背景（Combine the Badge Foreground and Background）
徽章设计要求在徽章背景上旋转并重复多次山形。
定义一种新的旋转类型，并利用ForEach视图将相同的调整应用于山形的多个副本。

![43236731-061e-4662-8f27-06d71ca8f000.png](https://static.kuwe.top/2019/6/0F2ir7GE5ccS5713FjaykWCsOtsQICr5h4nWvKWi776wB2V9cL2HnDhk3FVyecxW "43236731-061e-4662-8f27-06d71ca8f000.png")

##### 步骤1
创建一个新的`RotatedBadgeSymbol`视图以封装旋转符号。


##### 步骤2
在`Badge.swift`中，将徽章的符号放在徽章背景上，方法是将其放在`ZStack`中。

![Snip20190615_5.png](https://static.kuwe.top/2019/6/1ncZV69xy9RnO2WBHF2pmwVPCxZhWcdfU7x0FuCrZktRkHA6N6iMVcf3STxck9Xj "Snip20190615_5.png")

现在看来，徽章符号与预期的设计和背景的相对大小相比太大。

##### 步骤3
通过读取周围的几何图形并缩放符号来更正徽章符号的大小。

![Snip20190615_6.png](https://static.kuwe.top/2019/6/J4Zh5iF3ViyVRg1cDN95bKQt0obRxYYAg2FVZ7NjJVnayskHsAveyAZLwNOynMAH "Snip20190615_6.png")

##### 步骤4
添加`ForEach`视图以旋转并显示徽章符号的副本。

![Snip20190615_7.png](https://static.kuwe.top/2019/6/kSd6vSIZpeDUrXZhHnVHXUgIg7HmKgS95EBebaH2xhrAvoJltwmIQFdFkoKaqZ1l "Snip20190615_7.png")

完整的360°旋转分为八个部分，通过重复山脉符号创建一个类似太阳的模式。

### 检查你的理解

- 1.GeometryReader的目的是什么？
可选项：
a. 我们可以使用`GeometryReader`将父视图划分为用于在屏幕上布局视图的网格。
b. 我们可以使用`GeometryReader`动态绘制，定位和调整视图，而不是在应用程序中的其他位置或不同大小的显示器上重复使用视图时可能不正确的硬编码。
c. 我们可以使用`GeometryReader`自动识别应用程序视图层次结构中形状视图的类型和位置，例如`Circle`。

答案：b

- 2.如何在以下代码中列出视图？

```swift
ZStack {
   Circle().fill(Color.green)
   Circle().fill(Color.yellow).scaleEffect(0.8)
   Circle().fill(Color.orange).scaleEffect(0.6)
   Circle().fill(Color.red).scaleEffect(0.4)
}
```

可选项：
a.  ![47c8cfa0-9cbb-46f6-8af6-5485fb5e8211.png](https://static.kuwe.top/2019/6/1Gp2JNo71OmjrByD9ch77sxgWWWM4L69gajNVWjcRdOp6ZmuHKC3lx4BsPGz9Xno "47c8cfa0-9cbb-46f6-8af6-5485fb5e8211.png")

b. ![c36584f9-dba1-4897-8229-5e5b17731eda.png](https://static.kuwe.top/2019/6/KTAd0awy7fwYGx72ArVCHwet7ZlkUd6HSSHIv3jSLQOD2MoEQ4b2JJCu1SfanM6t "c36584f9-dba1-4897-8229-5e5b17731eda.png")

c. ![30a550d3-d021-49a8-a260-dd9161d215a5.png](https://static.kuwe.top/2019/6/5olRwa3lzfNYkAzwRS9tek0e24YFiESsxksvlsriUglKfFbYUsVFMd2hFXVZEOWv "30a550d3-d021-49a8-a260-dd9161d215a5.png")

答案：a

- 3.以下绘图代码的形状是什么形状？

```swift
Path { path in
   path.move(to: CGPoint(x: 20, y: 0))
   path.addLine(to: CGPoint(x: 20, y: 200))
   path.addLine(to: CGPoint(x: 220, y: 200))
   path.addLine(to: CGPoint(x: 220, y: 0))
}
.fill(
   LinearGradient(
       gradient: .init(colors: [Color.green, Color.blue]),
       startPoint: .init(x: 0.5, y: 0),
       endPoint: .init(x: 0.5, y: 0.5)
   )
)
```

可选项：
a. ![03a3b1fa-2fa4-4409-8ff5-6394d4a4317b.png](https://static.kuwe.top/2019/6/VnbXhFo59JBdHd7tjWKTCJ9tmKT0iONkN8F0Khtf7n41HgwV5Ri4mQp30rhvO0J7 "03a3b1fa-2fa4-4409-8ff5-6394d4a4317b.png")

b. ![aceaf67a-466c-44c1-9b25-415f889c7b4c.png](https://static.kuwe.top/2019/6/EJGBd1Wkv7RuZHdWvpuJc4GwiS3Nvnyb2Dt9J8KgWXNVIbvnOIkGEqDt3N1XUnxq "aceaf67a-466c-44c1-9b25-415f889c7b4c.png")

c. ![69603008-9e73-43c8-8ebc-6e9918d40aa7.png](https://static.kuwe.top/2019/6/1yZWb6jKhI5JgvsdDOzEeD0ObA1d05pou19e6TXrROjdGmO8wH8iRe43RrTG8mjt "69603008-9e73-43c8-8ebc-6e9918d40aa7.png")

答案：c
