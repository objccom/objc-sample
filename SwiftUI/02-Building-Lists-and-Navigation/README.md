### 简介
此示例是记录学习SwiftUI的过程，原文出自[
SwiftUI Essentials Building Lists and Navigation](https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation)。

在[SwiftUI 01-创建和组合视图 (Creating and Combining Views)](https://objc.com/article/23) 中创建了`landmark `的详情页，本节我们做`landmark `的列表页。

我们将创建可以显示任何`landmark `信息的视图，并动态生成一个滚动列表，用户可以点击该列表查看`landmark `的详细视图。要微调UI，我们将使用Xcode的画布以不同的设备大小呈现多个预览。

[下载项目文件](https://docs-assets.developer.apple.com/published/d27acff90f/BuildingListsAndNavigation.zip)以开始构建此项目，并按照以下步骤操作。

### 第一节 了解示例中的数据
在第一个教程中， 我们直接把数据写死在视图的代码中。现在我们将学习把数据传递给自定义视图以供其显示。
首先下载入门项目并熟悉示例数据。

![2f8f9d15-348e-4c7f-b53d-be31a5d8c457.png](https://static.kuwe.top/2019/6/8e5SncP7so6qT2WYDbcK40r1GScp0Rw0b3aD46hmrgTtGz3nYqrtyt5XqbWKEFvT "2f8f9d15-348e-4c7f-b53d-be31a5d8c457.png")

- 1.在Project导航器中，选择`Models> Landmark.swift`。
`Landmark.swift`声明了一个`Landmark`的结构体，用于存储应用程序需要显示的所有`landmark `信息，根据`landmarkData.json`中其中一组数据的所有字段构建的`landmark `的model。

- 2.在Project导航器中，选择`Resources> landmarkData.json`。

我们将在本教程的其余部分以及随后的所有内容中使用此示例数据。

- 3.请注意，[创建和组合视图](https://objc.com/article/23)中的`ContentView`类现在被修改为`LandmarkDetail`。

我们将在此以及以下每个教程中创建多个view的类。

### 第2节 创建行视图

我们将在本教程中构建的第一个视图是用于显示每个地标的详细信息的行。 此行视图将信息存储在其显示的地标的属性中，以便一个视图可以显示任何地标。 稍后，您将多个行组合成一个地标列表。

![6f1c3da5-34c7-4c27-ba77-270ed2a29272.png](https://static.kuwe.top/2019/6/fBYTOuMFI7yoX04dgDygqGTRzBkbUw1fwRP94FCST9Ig6XulKP6DbJqCQjfd5bCg "6f1c3da5-34c7-4c27-ba77-270ed2a29272.png")

- 1.创建一个名为`LandmarkRow.swift`的新`SwiftUI`视图。

- 2.如果预览不可见，请通过选择`Editor > Editor and Canvas`来显示画布，然后单击`Get Started`。

- 3.添加`LandmarkRow`类中添加一个`Landmark `类型的`landmark`属性作为这个视图的模型。

```swift
import SwiftUI

struct LandmarkRow : View {
    var landmark: Landmark
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkRow()
    }
}
#endif
```

添加`landmark`属性时，预览将停止工作，因为`LandmarkRow`类型在初始化期间需要传入一个`Landmark`的模型。

![Snip20190609_41.png](https://static.kuwe.top/2019/6/Idow8SZ5OOUIvdI9I7F5B4PhLx6jEBX85hXL1W0AU9Lcb7Z77xhQdiIEY9eS64q9 "Snip20190609_41.png")

要修复预览，我们需要修改预览中初始化`LandmarkRow()`的代码。

- 4.在`LandmarkRow_Previews`的预览静态属性中，将`landmark`参数添加到`LandmarkRow()`初始化方法的参数中，指定`landmarkData`数组的第一个元素。

预览显示文本Hello World。


修复后，您可以为行构建布局。

- 5.将现有文本视图嵌入HStack中。

- 6.修改文本视图以使用`landmark `属性的`name`。

- 7.通过在文本视图之前添加图像来完成行。

![Snip20190609_42.png](https://static.kuwe.top/2019/6/RltUxcRAqmWIsvp0CQ4KRXe2cKgtDY2HAstBjJ5uJtKzsiP1QsMmjvK7LVnryAI7 "Snip20190609_42.png")

### 第3节 自定义行预览

Xcode的画布自动识别并显示当前编辑器中符合PreviewProvider协议的任何类型。 预览提供程序返回一个或多个视图，其中包含用于配置大小和设备的选项。

我们可以从预览提供程序自定义返回的内容，以准确呈现对我们最有帮助的预览。

![de4301fa-bf9c-45ac-b7f2-bbb990ccb41b.png](https://static.kuwe.top/2019/6/ScBhQfssl7xvrb9LPuSufwA1sMekhdvz5k6RHln46TkhkdSMtWau7V2QbzwpYpK5 "de4301fa-bf9c-45ac-b7f2-bbb990ccb41b.png")

- 1.在`LandmarkRow_Previews`中，将`landmark`参数更新为`landmarkData`数组中的第二个元素。

修改后预览立即更改以显示第二个model的数据而不是第一个。

- 2.使用`previewLayout(_ :)`方法设置列表中这一行的cell大小。

我们可以在`previews `中使用`group`返回多行cell预览。

- 3.将返回的行换放到一个`Group `中，然后在`Group`中再添加一个`LandmarkRow`。

![Snip20190609_43.png](https://static.kuwe.top/2019/6/Hb2JCYYhKkOi7ESOSi0eVv3DJa6mIon4agwtzaAWB6H1b8D5yCvGWiBzXxq3fXCj "Snip20190609_43.png")

![Snip20190609_44.png](https://static.kuwe.top/2019/6/XWzasn32JYUIz8umE2sy3cEykrqQb6tb20OkXVLTANCvDN8nmabTgunSNdSYMU43 "Snip20190609_44.png")

`Group`是用于对视图内容进行分组的容器。 Xcode将组的子视图渲染为画布中的单独预览。

- 4.要简化代码，请将`previewLayout(_ :)`调用移动到`Group`的子声明外部。

```swift
import SwiftUI

struct LandmarkRow : View {
    var landmark: Landmark
    
    
    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
```

视图的子项继承视图的上下文设置，例如预览配置。


我们在预览提供程序中编写的代码仅更改`Xcode`在画布中显示的内容。 由于`#if DEBUG`指令，编译器会删除代码，因此它在release下不会打包到应用程序中。

### 第4节 创建`landmark`列表

使用`SwiftUI`的`List`类型时，可以显示特定于平台的视图列表。 列表的元素可以是静态的，就像我们目前创建的堆栈的子视图一样，或者是动态生成的。 您甚至可以混合静态和动态生成的视图。

![c91b6546-1230-43a2-8867-2f0e445edb99.png](https://static.kuwe.top/2019/6/PkucZqg91awMLX6Tz5g6DmcNIL6PhdHP5MAbvVvfzucuUjTPFShAQIyKJCc0GQrz "c91b6546-1230-43a2-8867-2f0e445edb99.png")

- 1.创建一个名为`LandmarkList.swift`的新`SwiftUI`视图。

- 2.用`List`替换模板中默认的`Text`视图，并在`List`中添加两个`LandmarkRow`初始化的视图作为两行显示。

现在我们预览显示以适合iOS的列表样式呈现的两个`landmark`，这个`List`不就是`UITableView`吗？

![Snip20190609_45.png](https://static.kuwe.top/2019/6/9F223M2d9NOkYZ7jM0ywBkuidC22aeWKsfVPhxtG3d7joCTYiDhJPlEXLlzaBTCe "Snip20190609_45.png")


### 第5节 使列表动态化

我们可以直接从集合中生成行，而不是单独指定列表的元素。

我们可以通过传递数据集合以及为集合中的每个元素提供视图的闭包来创建显示集合元素的列表。 该列表使用提供的闭包将集合中的每个元素转换为子视图。

![3f2f8071-97e1-481e-92a2-efb18be01ec7-1.png](https://static.kuwe.top/2019/6/q6k5q9E2Ag9GhFUP07ISgwELmaWMHw9do2i8RK8QdhPnoPxKVsQiPkg0dcZMx5vw "3f2f8071-97e1-481e-92a2-efb18be01ec7-1.png")

- 1.删除`List`中两个静态的`LandmarkRow`，然后将`landmarkData`传递给`List`的初始化方法中。

列表使用可识别的数据。 我们可以通过以下两种方式之一来识别数据：通过调用`identified(by:)`方法，使用唯一标识每个元素的属性的键路径，或者使您的数据类型遵守`Identifiable `协议。

- 2.通过从闭包返回`LandmarkRow`来完成动态生成的列表。

这为`landmarkData`数组中的每个元素创建一个`LandmarkRow`。

接下来，我们将通过向`Landmark`类型添加`Identifiable`协议来简化`List`代码。

- 3.切换到`Landmark.swift并`声明符合可识别协议。

由于`Landmark`类型已经具有`Identifiable`协议所需的`id`属性，因此没有其他工作要做。

- 4.切换回`LandmarkList.swift`并删除`landmarkData`调用的`identified(by:)`方法。

```swift
import SwiftUI

struct LandmarkList : View {
    var body: some View {
        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif
```

从现在开始，我们将能够直接使用`Landmark`元素的集合。

### 第6节 在列表和详细信息之间设置导航

列表正确呈现，但我们无法点击某个`landmark`以查看它的详细信息页面。

通过将导航功能嵌入到`NavigationView`中，然后将每行嵌套在`NavigationButton`中以设置到目标视图的转换，可以将导航功能添加到列表中。

![c6f21df9-1d6d-42d4-b21b-0a2588f4cd97.png](https://static.kuwe.top/2019/6/lYnoOvn6mh6IaCzsxYMu6Ijb4voN89ZqUXco5SrT05Cd56MI6FvMOxFhPBPBRmHJ "c6f21df9-1d6d-42d4-b21b-0a2588f4cd97.png")

- 1.在`NavigationView`中嵌入动态生成的`landmark`列表。

- 2.调用`navigationBarTitle(_ :)`修饰符方法以在显示列表时设置导航栏的标题。

![Snip20190609_48.png](https://static.kuwe.top/2019/6/SMNml9SrW9fjZpogJWlpQvEoq6eRJyenMAdABIJloo3Cy8jwzQFgs5s9iRh0pPxn "Snip20190609_48.png")

- 3.在列表的闭包内，将返回的行包装在`NavigationButton`中，将`LandmarkDetail`视图指定为目标。

- 4.我们可以通过切换到实时模式直接在预览中尝试导航。 单击“实时预览”按钮，然后点击地标以访问详细信息页面。

![Snip20190609_49.png](https://static.kuwe.top/2019/6/LRiyzm0nLrGozHg5HyJeANBq9SrojreyaWMmjmUG4JfQo3ZYCgIUT13t0wEq2RUb "Snip20190609_49.png")

### 第7节 将数据传递到子视图

`LandmarkDetail`视图中是使用写死的数据展示UI 的。 就像`LandmarkRow`一样，我们需要在`LandmarkDetail`中添加一个`Landmark`类型的模型以作为其数据源显示view。

从子视图开始，我们将转换`CircleImage`，`MapView`和`LandmarkDetail`以显示传入的数据，而不是将数据写死在代码中。

![cb49732f-cb3e-4e77-a2e6-84f7f7618502.png](https://static.kuwe.top/2019/6/sl7DzsO9Ii1M76DaTnA5iZSTtbrLp4lYgWsjrKgxeWf6Cq0X6vXswtKrKCQZRbny "cb49732f-cb3e-4e77-a2e6-84f7f7618502.png")


- 1.在`CircleImage.swift`中，将存储的图像属性添加到`CircleImage`。

```swift
import SwiftUI

struct CircleImage : View {
    
    var image: Image
    
    var body: some View {
        image
            // 给图片添加圆角
            .clipShape(Circle())
            // 给圆角添加边框
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            // 添加半径为10的阴影
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif

```

这是使用`SwiftUI`构建视图时的常见模式。 自定义视图通常会包装并封装特定视图的一系列修饰符。

- 2.更新`CircleImage_Previews`，给其传递一个`Turtle Rock`的图像使其可以正常预览。


- 3.在`MapView.swift`中，向`MapView`添加一个坐标属性，并转换代码以使用该属性，而不是在代码中写死纬度和经度数据。

```swift

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {

        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
```

- 4.更新预览提供程序以传递数据数组中第一个`landmark`的坐标。

```swift

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
```

- 5.在`LandmarkDetail.swift`中，将`Landmark`类型的属性添加到`LandmarkDetail`类型中，作为其model数据。

- 6.更新预览以使用`landmarkData`中的第一个`lanmark`。

- 7.完成将所需数据传递给您的自定义类型。

- 8.最后，调用`navigationBarTitle(_：displayMode :)`方法，在显示详细视图时为导航栏指定标题。


- 9.在`SceneDelegate.swift`中，将`rootViewController`的`rootView`修改为为`LandmarkList`，这样首页展示的就是列表页了。

当我们在模拟器中独立运行而不是预览时，我们的应用程序将以`SceneDelegate`中定义的根视图开始。

- 10.在`LandmarkList.swift`中，将当前`landmark`传递到目标`LandmarkDetail`中，关键代码为`NavigationButton(destination: LandmarkDetail(landmark: landmark)) `。

```swift
import SwiftUI

struct LandmarkList : View {
    var body: some View {
        // 设置导航容器
        NavigationView {
            // 初始化一个类型TableView的view
            List(landmarkData) { landmark in
                // 点击cell时，将当前`landmark`传递到目标`LandmarkDetail`中。
                NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                    
                    LandmarkRow(landmark: landmark)
                }
            }
            // 显示当前列表页的导航标题
            .navigationBarTitle(Text("Landmarks"))
        }
        
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif

```

- 11.切换到实时预览以查看从列表导航时详细视图显示正确的标志

### 第8节 动态生成预览

接下来，我们将向`LandmarkList_Previews`预览提供程序添加代码，以显示不同设备大小的列表视图的预览。 默认情况下，预览会以活动方案中设备的大小进行渲染。 我们可以通过调用`previewDevice(_ :)`方法来更改预览设备。

![475e4ac3-b605-4309-a294-e9d2efa6f1ab.png](https://static.kuwe.top/2019/6/EjUPiTY25TEP2r79qjS6YWViuXHMRozegECNvQWzSD6cbTUDo6dnIMRUpdEYT0fX "475e4ac3-b605-4309-a294-e9d2efa6f1ab.png")

- 1.首先，将当前列表预览更改为以`iPhone SE`的大小呈现。

```
#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
            // 以iPhone SE 设备的大小预览画布
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
    }
}
#endif

```

我们可以提供`Xcode`方案菜单中显示的任何设备的名称。

![Snip20190609_50.png](https://static.kuwe.top/2019/6/jsOQI5dbYZHGppnJoBBn1OKGMhe3zBSrUU8jbd2FsLvuuSqJ0QOS1anXjMuWMrpY "Snip20190609_50.png")


- 2.在画布中添加对多个设备的预览
在预览的列表中，使用设备名称数组作为数据，将`LandmarkList`嵌入到`ForEach`实例中。

![Snip20190609_51.png](https://static.kuwe.top/2019/6/wNwIXPwrksAfFHpGNgeVQ5wsa8EL4zO1rKceNOW5C3xdarZdGzXBr9WeNHbldV8H "Snip20190609_51.png")

`ForEach`以与列表相同的方式对集合进行操作，这意味着我们可以在任何可以使用子视图的位置使用它，例如在堆栈，列表，组等中。 当数据元素是简单的值类型 - 就像在这里使用的字符串一样 - 我们可以使用`\ .self`作为标识符的关键路径。

- 3.使用`previewDisplayName(_ :)`修饰符将设备名称添加为预览的标签。

![Snip20190609_52.png](https://static.kuwe.top/2019/6/hEqsinH8IRPKHxWJI0PaTLW2rCVIgLjtoVIJoIvb320CXoNXcN79UC5ZvXWAL4PR "Snip20190609_52.png")

- 4.我们可以尝试使用不同的设备来比较视图的渲染，所有这些都来自画布。


