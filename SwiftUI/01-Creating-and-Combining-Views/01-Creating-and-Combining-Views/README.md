### 简介
此示例是记录学习SwiftUI的过程，原文出自[apple.com](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)。

本示例使用SwiftUI完成一个iOS应用程序`Landmarks`（地标），用于发现和分享喜欢的地方。我们先构建`Landmarks`详情的视图。
为了方便布局view，`Landmarks`使用stacks来组合和分层图像和文本视图组件。我们需要基于`MapKit`构建地图，并将其添加到view中。修改视图的布局时，`Xcode`会提供实时的预览效果，我们还可以通过Xcode提供的canvas（画布）轻松的找到对应的代码，比如点击canvas上面的某个view，其对应的代码就会高亮，请看下图。
![Snip20190608_5.png](https://static.kuwe.top/2019/6/9UaVvf5BFNR6RGrz4OVJ44J6dVhVbh2Dfaqb6eKBP1b7V0uZczmSErLC33JXH1WE "Snip20190608_5.png")

### 创建项目并预览画布
使用xcode创建SwiftUI项目。浏览画布、预览和SwiftUI模板代码。
要在Xcode中预览画布上的视图并与之交互，环境依赖MacOS 10.15和Xcode 11及以上。

##### 创建项目
- 1.打开Xcode，在Xcode的启动窗口中单击`Create a new Xcode projec`，或选择`File > New > Project`。

- 2.在模板选择器中，选择iOS作为平台，选择`Single View App`模板，然后单击`Next`。
![Snip20190608_1.png](https://static.kuwe.top/2019/6/aZwpSEdXFi0TB1CdGHgicpTtkllfErLcmcZ97B7turlb7Rblfj2RobATYY6afcqC "Snip20190608_1.png")

- 3.输入“Landmarks”作为`Product Name`，选择`Use SwiftUI`复选框，然后单击`Next`。 选择一个位置以在Mac上保存标记项目。
![Snip20190608_6.png](https://static.kuwe.top/2019/6/o9TC8UcG0yWdu2uJ5uTLC4bP3dpqU6EeY85iSb6Dxt2uoVHTUgCfhSiNjXEvwOOE "Snip20190608_6.png")

- 4.在项目导航器中，单击以选中`ContentView.swift`。
默认情况下，SwiftUI视图文件声明了两种结构。 第一个结构符合`View`协议，描述了视图的内容和布局。 第二个结构声明该画布视图的预览。
![Snip20190608_8.png](https://static.kuwe.top/2019/6/hFhZ1gi1Hdzx7Ov39Btd4INnfuK26eFbK61B1ZxiaffDNoyQ4iR4B5XpIkOGmlci "Snip20190608_8.png")

- 5.在画布中，单击“Resume”以显示预览。
![Snip20190608_9.png](https://static.kuwe.top/2019/6/trIGGTMu8LTqDvseOMNMFGlaCk1QZguADzhIQUMqEHs1Oh36p5YBm6JOQ9WuNeHx "Snip20190608_9.png")

如果你的Xcode11中找不到画布，请选择` Editor > Editor and Canvas`以显示它。
![Snip20190608_10.png](https://static.kuwe.top/2019/6/mC70YCKnK3mlYNZ7nWcOIRb4ca7oSPpzEoOYsdFstFZYnnyVBwFJrODxzTDRvjGe "Snip20190608_10.png")

- 6.在`body`属性中，将“Hello World”更改为自己的问候语。
![Snip20190608_13.png](https://static.kuwe.top/2019/6/is4IzymwHEPmqq3BzUQGlEVOWHaeEdKBnlDKAvxayp3YMEMeWfMFQEJxR6vdnE3b "Snip20190608_13.png")

当我们更改视图的`body`属性中的代码时，右侧的预览画布会实时显示我们的改变。

##### 自定义文本视图
我们可以修改代码来自定义视图的显示。
在构建`Landmarks `应用程序时，可以使用任何编辑器组合： 代码编辑器（source editor）、 画布（canvas ）或 检查器（inspectors ）。无论使用哪种工具，代码都会保持更新。

![Snip20190608_14.png](https://static.kuwe.top/2019/6/nVMasY7bXcA2ICCON9TRPDVX9LoByLwAAozmUGvTQHTAuspCeVHNoYIkFYMvkUC0 "Snip20190608_14.png")

- 1.使用检查器（inspectors）自定义文本视图。
在预览画布中，长按`Command`键并单击`Hello World`，此时会弹出结构化编辑窗口，然后选择`Inspect`（检查器）。
![Snip20190608_15.png](https://static.kuwe.top/2019/6/4YAAWEixO9IUipOzZg9RgOI9Eu9IidY2yQkSsEO76XVKz5Eu9XfiHyRRdrhzNqUv "Snip20190608_15.png")

弹出窗口显示我们可以根据该控件自定义的不同属性，具体取决于自定义的view类型。

- 2.使用`Inspect`（检查器）将文本内容更改为“Turtle Rock”，即您将在应用中显示的第一个`landmark `的名称。

- 3.修改`Font`为`Title`
这将系统字体应用于文本，以便它正确响应用户的首选字体大小和设置。

- 4.手动编辑代码以添加`.color(.blue)`修饰符; 这会将文本的颜色更改为蓝色。
要自定义SwiftUI视图，请调用称为修饰符的方法。 修改器包装视图以更改其显示或其他属性。 每个修改器都返回一个新视图，因此链接垂直堆叠的多个修改器是很常见的。

![Snip20190608_17.png](https://static.kuwe.top/2019/6/MAQVO8pZ18YbkqnXjEr5Er1zm3dwrqv384mwuQcAxDjGgU9dYSSC7rwbq4lUszDC "Snip20190608_17.png")

我们的代码始终是视图的真实来源。 当使用检查器更改或删除修改器时，Xcode会立即更新我们的代码。

- 5.通过代码编辑器使用`Inspect`（检查器）修改控件的样式。
这与在预览画布上使用`Inspect`（检查器）的操作相同，我们将鼠标放在代码编辑器中的控件上，然后长按`Command`，并单击该控件，比如`Text("Turtle Rock")`，此时会弹出弹框，我们选择`Inspect`选项后，会弹出像预览画布那样操作后弹出的弹窗，在这个弹窗上面修改控件的样式即可。
![Snip20190608_22.png](https://static.kuwe.top/2019/6/2CFuKX8WpcBa57yHsbBoTiaskTHDEIecVriiERqAqnc5aBM9UuAwD2WlKgGs1IUw "Snip20190608_22.png")

-6.在编辑器中，将弹出窗口中的`color`选项设置为`Inherited `，就会再次将文本颜色更改为默认的颜色`黑色`。
请注意，此时Xcode会自动更新代码删除颜色`color(.blue)`修饰符，以反映在检查器中的更改。
![Snip20190608_23.png](https://static.kuwe.top/2019/6/jegcj2I4NM4HzWaOVTEop2pTUMPCgRftyUvrdXi2At76Je4mzTWtQ0y2bEd6ydZI "Snip20190608_23.png")

##### 使用Stacks 组合视图
上面我们这个页面添加了一个标题视图，下面我们添加一个详情描述视图，用来显示位置的。
在创建SwiftUI视图时，我们可以在视图的`body`属性中描述其内容、布局和行为; 但是，`body`属性中只能添加单个视图。 如果要在body中添加多个视图，可以在`Stacks`，在`Stacks`中嵌入多个视图，`Stacks`允许三种布局方式：水平`HStack`、垂直`VStack`、从后到前`ZStack` 组合在一起。

![546a4d34-fef9-4574-a405-d16ec83ca7fe.png](https://static.kuwe.top/2019/6/0hFtz5OdguqtKvCatdREylPJpjxgu6yS2r3pyWFA3mPme0ktirfckhSxsPQJGSEL "546a4d34-fef9-4574-a405-d16ec83ca7fe.png")

现在我们使用`Stacks`的垂直布局方式，将标题和详情组合在一起。

我们可以使用Xcode的代码编辑中的`Inspect`（检查器）在`body`中添加一个`VStack`。

- 1.按住`Command`键并单击`Text("Turtle Rock")`以显示结构化编辑弹出窗口，然后选择`Embed in VStack`。
![Snip20190608_26.png](https://static.kuwe.top/2019/6/3e22NKteMKhGpDdLU8aYZy4t9Wv3hD2YVFmhza2nunTAcPUWG4EjLeOgN6lvuWO1 "Snip20190608_26.png")

- 2.接下来，通过从库中拖拽`Text`视图到`VStack`视图中。
单击Xcode窗口右上角的加号按钮（`+`）打开库，然后在“Turtle Rock”文本视图后立即将`Text`视图拖到代码中的位置。

![Snip20190608_29.png](https://static.kuwe.top/2019/6/2jFauQThHh6yiJsIhk1qX2sU1hJadCkqT1uePTRw3zLjk0tNdvzDV4b6Or22ZR13 "Snip20190608_29.png")


- 3.用`Joshua Tree National Park. `替换文本视图的占位符文本。

根据需求自定义这个文本的字体。
- 将刚才添加的`Text`控件的的字体设置为`.subheadline`。

- 4.`VStack`默认是`center`居中对齐，编辑`VStack`的初始化方法，将其修改为`VStack(alignment:.leading) `，按前导对齐视图。
![Snip20190608_30.png](https://static.kuwe.top/2019/6/oyxtOyfGJCvDXRKOfQdVO9PHP7HydTmv5WzcUAsI3NfLR1pqU8iI9FOFGKOrNCK3 "Snip20190608_30.png")

接下来，我们将在该位置`Text`的右侧添加另一个`Text`视图，用来描述该公园的状态。

- 5.在画布上，按住`Command`键点击`Joshua Tree National Park`，然后选择`Embed in HStack`。此时代码会被自动同步为：
```swift
struct ContentView : View {
    var body: some View {
        VStack(alignment:.leading) { 
            Text("Turtle Rock")
                .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                }
        }
        
    }
}
```
然后在拖拽一个`Text`控件到`HStack`中，用以显示状态的文本。

- 6.让布局使用设备的整个宽度，将`Spacer()`添加到包含两个文本视图的水平堆栈来分隔驻留和状态。
![Snip20190608_32.png](https://static.kuwe.top/2019/6/ds0ARhIQdKsFQk3LUAp9wLnQT0TCfjlcNmOSeOjRw5GuhL6cbPseBYuzL7U7q0ZH "Snip20190608_32.png")

spacer展开以使其包含视图使用其父视图的所有空间，而不是仅通过其内容定义其大小。

- 7.最后，使用`padding()`修饰符方法为地标的名称和细节设置间距。

```swift

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack(alignment:.leading) { 
            Text("Turtle Rock")
                .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    // 让 HStack 中的子控件宽度充满整个父视图
                    Spacer()
                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                }
        }
        // 设置间距
        .padding()
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

```

##### 创建自定义ImageVew
上面我们添加了名称和详情文本视图，接下来要做的是为`landmark `添加图像。

我们将创建一个自定义视图，将遮罩，边框和阴影应用于图像，而不是在此文件中添加更多代码。

首先将图像添加到项目的`Assets.xcassets  `中。

- 1.在项目文件的Resources文件夹中找到`turtlerock.png`; 将其拖到`Assets.xcassets`中。 Xcode为图像创建新的图像集。

接下来，我们将为自定义图像视图创建一个新的SwiftUI视图。

- 2.选择`File > New > File`以再次打开模板选择器 在` User Interface `部分中，单击以选中`SwiftUI View `，然后单击`Next `。 将文件命名为`CircleImage.swift `，然后单击`Create `。

![Snip20190608_33.png](https://static.kuwe.top/2019/6/WjLMAOgWkeP0lucSJil4hVSQDIn68iiEAjfs0nKADIp1ZbYtuzlfkhsi47GFiWs7 "Snip20190608_33.png")

我们已准备好插入图像并修改其显示以匹配所需的设计。

- 3.使用`Image(_:)  `初始化方法将默认生成的模板的`body`中的`Text`视图替换为`Image("turtlerock")`。

```swift
import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
```

- 4.调用`.clipShape(Circle())`方法以将ImageView裁切为圆形。
圆形类型是一种可用作蒙版的形状，或通过为圆形提供笔触或填充的视图。

![Snip20190608_34.png](https://static.kuwe.top/2019/6/p8nEdnFZwDANMwclgYaNatPKHMDPz1GP5IB1PvIFpf7MsAYeirYWvrEoZCntfvxZ "Snip20190608_34.png")

- 5.给圆角添加边框

![Snip20190608_35.png](https://static.kuwe.top/2019/6/L0unTa2zvnCf9Nv9qxS26jZ5X5ETbGwMPFRyfXoJn5Sn47qDe73ZamGWqbvcgFM8 "Snip20190608_35.png")

- 6.接下来，添加半径为10点的阴影。

![Snip20190608_37.png](https://static.kuwe.top/2019/6/58Zz9c9e1ehROlEztOTVizMpbMmh7yvfRBdSiwrKIo2hivBLzllW2KEI8RZA4zUW "Snip20190608_37.png")

这样就完成了图像视图。

##### 同时使用`UIKit `和`SwiftUI `的视图
现在我们已准备好创建地图视图。 可以使用`MapKit`中的`MKMapView`类来渲染地图。
要在`SwiftUI中`使用`UIView`子类，可以将其他视图包装在符合`UIViewRepresentable`协议的`SwiftUI`视图中。 `SwiftUI`包含`WatchKit`和`AppKit`视图的类似协议。

![b9753927-fb44-4f74-876f-31d9126cbb16.png](https://static.kuwe.top/2019/6/nBjO2EnFsUu3wwm90uolMEfPfMG8842bQ6NGcE3Kaf4xudFtMG5YKqs9CHG5nUVG "b9753927-fb44-4f74-876f-31d9126cbb16.png")

首先，我们将创建一个自定义视图用于显示`MKMapView`。

- 1.选择`File> New> File`，选择`iOS`作为平台，选择`SwiftUI View`模板，然后单击`Next`。 将新文件命名为`MapView.swift`，然后单击`Create`。

- 2.使用`import`关键字导入`MapKit`，并让`MapView`遵守`UIViewRepresentable`协议。

```swift
import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
```

不要担心Xcode提示的错误; 我们将在接下来的几个步骤中解决这个问题。

`UIViewRepresentable`协议有两个必须要实现的方法：
```
    /// 创建一个要呈现的`UIView`实例。
    func makeUIView(context: Self.Context) -> Self.UIViewType

    /// 将呈现的`UIView`（和协调员）更新为最新版本
    func updateUIView(_ uiView: Self.UIViewType, context: Self.Context)
```

- 3.实现`makeUIView(context :)`方法，用其替换模板中的`body`属性，在该方法创建并返回一个空的`MKMapView`。

```swift
import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
```

- 4.创建一个`updateUIView(_：context :)`方法，将地图视图的区域设置为正确的坐标，并让地图控件在Turtle Rock上居中。

当预览处于静态模式时，它们仅完全呈现`SwiftUI`视图。 因为`MKMapView`是一个`UIView`子类，所以需要切换到实时预览才能看到地图。

- 5.单击`Live Preview`（实时预览）按钮可将预览切换为实时模式。 您可能需要单击预览上方的`Try Again`或`Resume `按钮。

![Snip20190608_38.png](https://static.kuwe.top/2019/6/0GRSb2EUAKqI8TUg7Bu5Qy1BmX0eg48ty69FhcyeBA0AntdNQWmiVrJLzpL1dHcP "Snip20190608_38.png")

启动实时预览后，我们便能看到地图上的数据了。

##### 将自定义的`MapView`添加到详情视图中
我们现在拥有了4个所需的所有组件：1.名称文本，2.地点文本，3.圆形图像，4.位置图。
使用您目前使用的工具，组合您的自定义视图以创建标志性详细视图的最终设计，下面是效果图：
![973ba702-85db-4852-851f-86a94cfca002.png](https://static.kuwe.top/2019/6/i0SjQlob0B9C1vVTfvzRU8WfJ9s87bOKkABjYpgY8BdhxNuR7YBdWCeWoiUwa8UW "973ba702-85db-4852-851f-86a94cfca002.png")

- 1.在项目导航中，选中 `ContentView.swift` 文件。

- 2.在另一个`VStack`中嵌入一个包含三个文本视图的`VStack`。

```swift
import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    // 让 HStack 中的子控件宽度充满整个父视图
                    Spacer()
                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                }
            }
            // 设置间距
            .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

```

- 3.在根`VStack`中添加刚才自定义的`MapView`，设置其frame的高为300。

![Snip20190608_39.png](https://static.kuwe.top/2019/6/JjmbUtgPNJc6J7e01w9EqLn1IunSHJkFWEw2hvxkLw8dLFoVxLBDLZtQvans0MnO "Snip20190608_39.png")

当我们仅指定`frame`的`height`时，视图会自动调整其内容的宽度。 在这种情况下，`MapView`会扩展以填充可用空间。

- 4.单击预览画布上的`Live Preview`（实时预览）按钮以在组合视图中查看渲染的地图。

您可以在显示实时预览时继续编辑视图。

- 5.将自定义的`CircleImage` view 添加到根`VStack`中，并放在`MapView`的下面。

- 6.要将图像视图叠加在地图视图的顶部，请为图像提供垂直-130个点的偏移量，并从视图底部填充-130个点。


这些调整通过向上移动图像为文本腾出空间。

- 7.在根`VStack`外部的底部添加一个`spacer `垫片，将内容与屏幕顶部对齐。

![Snip20190608_40.png](https://static.kuwe.top/2019/6/LevZGaiXuYCTVutPPSc1ZUv9WSqPOag9c68pb3xSqmxZLnlZVqydXVRaLIyZohF8 "Snip20190608_40.png")

- 8.最后，要允许地图内容扩展到屏幕的上边缘，请将`edgesIgnoringSafeArea(.top)  `修改器添加到地图视图中。




