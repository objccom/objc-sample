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


