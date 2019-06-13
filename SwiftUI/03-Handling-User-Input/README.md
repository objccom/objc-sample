这里记录学习和翻译 Apple SwiftUI 的示例，[原文链接](https://developer.apple.com/tutorials/swiftui/handling-user-input)

### 简介
本章是[Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui/handling-user-input)的第三个示例，用SwiftUI实现一个叫`Landmarks `的app。本章要点：用户可以标记他们最喜欢的地方，并过滤列表以仅显示他们最喜欢的地方。要创建此功能，首先要向列表中添加一个开关，以便用户只关注自己的收藏夹，然后添加一个星形按钮，用户点击该按钮可将某个地标标记为收藏夹。

### 第1节 标记用户最喜欢的地标
首先增强列表，在用户收藏过的行上显示星标，让用户一眼就能看到他们的最爱。

- 1.列表上每一个item是`LandmarkRow`类型的视图实现的，所以，打开xcode项目，然后在项目导航器中选择`Landmarkrow.swift`。

![1bf9ef39-aec1-449a-bbf6-4a51ad14bbae.png](https://static.kuwe.top/2019/6/SYOycIWHxNlrKWQY7PZaOgAy4BcN6KNzIDFi8A96dD3UWtx38yb3HDnoQSyZOoAe "1bf9ef39-aec1-449a-bbf6-4a51ad14bbae.png")

- 2.在`spacer()`方法的下一行添加一个`Image`视图，用以显示星标。

```swift
import SwiftUI

struct LandmarkRow : View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
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

在SwiftUI的代码块中，我们可以使用`if`控制语句包含一些Views。

- 3.因为系统图像是基于矢量的，所以可以使用`foregroundColor()`（前景颜色）方法更改它们的颜色。

### 第2节 筛选列表视图
我们可以自定义`List`列表视图，以便它显示所有标志，或者只显示用户的收藏夹。要做到这一点，我们需要向`LandmarkList`类型添加一点状态。

状态是一个值或一组值，可以随时间变化，并影响视图的行为、内容或布局。使用带有`@state`属性的属性向视图添加状态。

![600e5b4c-d7c7-44dc-8c0a-642f91b15117.png](https://static.kuwe.top/2019/6/kLb0bEVLbnzoljQlAFOJK8HHc8u7cfq9GCsVsoowTTtsqT45xn07OD1dWTFYSR4w "600e5b4c-d7c7-44dc-8c0a-642f91b15117.png")

- 1.在项目导航器中选择`Landmarklist.swift`文件。在`LandmarkList`类中添加名为`showFavoritesOnly`的`@State`属性，其初始值设置为`false`。

```swift
import SwiftUI

struct LandmarkList : View {
    
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List(landmarkData) { item in
                NavigationButton(destination: LandmarkDetail(landmark: item)) {
                    LandmarkRow(landmark: item)
                }
            }
         
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

- 2.点击预览画布窗口的`Resume`按钮，以预览最新效果

当我们对视图结构进行更改（如添加或修改属性）时，需要手动刷新画布。

- 3.通过检查`ShowFavoritesOnly`属性和每个`Landmark.IsFavorite`值来筛选`LandmarksList`列表。

```swift
import SwiftUI

struct LandmarkList : View {
    
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                if !self.showFavoritesOnly || landmark.isFavorite {
                    NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
         
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

### 第3节 添加控件以切换状态
要让用户控制列表的筛选器，我们需要添加一个可以单独更改`showFavoritesOnly `值的控件。可以通过将绑定传递给切换控件来实现这一点。
绑定充当对可变状态的引用。当用户点击从关闭切换到打开，然后再次关闭时，控件使用绑定来相应地更新视图的状态。

![4dfb8edc-f346-4e2a-b998-677715c0f13f.png](https://static.kuwe.top/2019/6/36cftGQ9cwNq4CkUMgpvW8sSUBvxEkqNoTzBgLxJ6SS15KiD4Q8L7vUBB8U56WnU "4dfb8edc-f346-4e2a-b998-677715c0f13f.png")

- 1.创建一个嵌套的`ForEach `组，将标志转换为行。

```swift
import SwiftUI

struct LandmarkList : View {
    
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(landmarkData) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            
         
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

要在`List`中组合静态视图和动态视图，或组合两个或多个不同的动态列表或视图时，需要在`List`中添加`ForEach`类型，用于显示其中的列表，并将数据集合传递给该`ForEach`，而不是传递给`List`。

- 2.添加一个切换视图作为列表视图的第一个子级，将绑定单独传递给`showFavoritesOnly `。

```swift
import SwiftUI

struct LandmarkList : View {
    
    @State var showFavoritesOnly = true
    
    var body: some View {
        NavigationView {
            List {
                
                // 视图1 切换按钮
                // 使用$ 前缀 将showFavoritesOnly属性，绑定给Toggle控件
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                
                // 视图2 列表
                /*
                 要在`List`中组合静态视图和动态视图，或组合两个或多个不同的动态列表或视图时，需要在`List`中添加`ForEach`类型，用于显示其中的列表，并将数据集合传递给该`ForEach`，而不是传递给`List`。
                 */
                ForEach(landmarkData) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            
         
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



我们可以使用`$` 前缀访问绑定到状态变量或其属性之一。

- 3.使用实时预览并通过点击切换来尝试这个新功能。

![屏幕快照2019-06-12下午8.55.38.png](https://static.kuwe.top/2019/6/1t2GwcNZXhmy2jQK97hJXrj9Tk3zMxn1eVkVtQnaimxhAPla3t8bCny7bvslTLkz "屏幕快照2019-06-12下午8.55.38.png")

![屏幕快照2019-06-12下午8.55.46.png](https://static.kuwe.top/2019/6/FwfeIlPXOU9pC5aIvS0SXwkMuWtWMCTf0Qumg852Y3zkZxCGYyTJ8dnZzVa78gLW "屏幕快照2019-06-12下午8.55.46.png")

### 第4节 使用可绑定对象进行存储
我们需要将用户用户收藏的数据的标志存储到可绑定对象中，以进行持久化存储，方便下次启动app时用户可以查看这些收藏的数据。
可绑定对象是数据的自定义对象，可以从SwiftUI 环境的存储中绑定到视图。SwiftUI 监视对可绑定对象的任何更改，这些更改可能影响视图，并在更改后显示视图的正确版本。

![8137b90e-57c5-4cd5-b971-ab0d519ff99b.png](https://static.kuwe.top/2019/6/Xl2ZEQ0o4s1HwaVDDRuIFB1lDDRzzcuBfAfgqB9iXMA3RaRmc96oAdVsIAN7LSaM "8137b90e-57c5-4cd5-b971-ab0d519ff99b.png")

- 1.创建一个新的名为`UserData.swift `文件，并创建`UserData`类，让其遵守`BindableObject `协议，声明它为模型类型。

`BindableObject `在SwiftUI 中定义，是一个`protocol`
 用作视图模型的对象，[了解更多](https://developer.apple.com/documentation/swiftui/bindableobject)。

```swift
import Combine
import SwiftUI


import SwiftUI

final class UserData: BindableObject  {
    
}

```

- 2.在`UserData`这个Class 中，需要实现`BindableObject`协议中必需实现的属性`didChange `，并使用`PassthroughSubject `类初始化`didChange`属性。

```swift
import Combine
import SwiftUI

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    
}

```

`PassthroughSubject`是`Combine`框架中的一个发布者示例，它立即将任何值传递给其订阅者。 SwiftUI通过此发布者订阅我们的对象，并更新数据更改时需要刷新的所有视图。

- 3.添加`showFavoritesOnly`和l`andmarks`的存储属性，并给他们设置初始值。

```swift

import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()

    var showFavoritesOnly = false
    var landmarks = landmarkData
}
```


每当客户端更新模型的数据时，可绑定对象都需要通知其订阅者。 当其中一个属性更改时，`UserData`应通过其`didChange`发布者发布更改视图。

- 4.为通过`didChange`发布者发送更新的两个属性创建`didSet`处理程序。

```swift

import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()

    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }

    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
}

```

### 第5节 在视图中采用模型对象
既然已经创建了`UserData `对象，那么就需要更新视图，将其作为应用程序的数据存储。

![f8ba8b7d-d61b-4292-a771-d4f8ccf602bb.png](https://static.kuwe.top/2019/6/wQewpXUba2w2huLArAKDdgP4HpdJozaBMtlKh2BbrzwVfO31gQvQH3qFyxH9McYS "f8ba8b7d-d61b-4292-a771-d4f8ccf602bb.png")

- 1.在`LandmarkList.swift`中，将`showFavoritesOnly `的声明由`@State`替换为`@EnvironmentObject`，并将`environmentObject(_ :)`修饰符添加到预览中。

只要将`environmentObject(_ :)`修饰符应用于父级，此`userData`属性就会自动获取其值。

![Snip20190612_1.png](https://static.kuwe.top/2019/6/2uvCvc8biwcJNsLCWZaQrDihAA90rlPyzjNhbdYrNVGS8WC9fb9dYkjhhT8p5gbC "Snip20190612_1.png")

- 2.通过访问`userData`上的相同属性来替换`showFavoritesOnly`的用法。

就像在`@state`属性上一样，您可以使用`$`前缀访问到`userdata`对象成员的绑定。

- 3.创建`ForEach`实例时，使用`userData.landmarks`作为数据。

- 4.在`SceneDelegate.swift`中，将`environmentObject(_ :)`修饰符添加到`LandmarkList`。

```swift

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(
            rootView: LandmarkList()
                .environmentObject(UserData())
        )
        self.window = window
        window.makeKeyAndVisible()
    }

    // ...
}
```

要想看到`具有UserData`对象的持久化效果时，需要在模拟器或者真机上运行，在预览画布中无法看到这个效果。

- 5.更新`LandmarkDetail`视图以使用环境中的`UserData`对象。

在访问或更新landmark的收藏状态时，我们将使用`landmarkIndex `，这样您就可以随时访问该数据的存储的正确的持久化数据了。

```swift
import SwiftUI

struct LandmarkDetail : View {
    
    @EnvironmentObject var userData: UserData
    
    // 从userData 中查找正确的landmark 数据
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    
    var landmark: Landmark
    
    var body: some View {
        
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
    }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
#endif

```

- 6.切换回`LandmarkList.swift`并打开实时预览以验证所有内容是否正常工作。

### 第6节 为每行landmark视图创建收藏按钮
`Landmarks`应用程序现在可以在已过滤和未过滤的地标视图之间切换，但最喜欢的地标列表仍然是硬编码的。 要允许用户添加和删除收藏夹，我们需要在地标详细信息视图中添加收藏夹按钮。

![1146e2d9-6325-4910-92cd-1791bbceda60.png](https://static.kuwe.top/2019/6/Nv1pP6grzrv7lJ09QlSZh0HwKipEtpkwTnbY9ScMWlS4Mj22ZXq52PACFeCpLeus "1146e2d9-6325-4910-92cd-1791bbceda60.png")

- 1.在`LandmarkDetail.swift`中，将`Text(landmark.name)`嵌入到`HStack`中。

- 2.在`landmark`的`name`右侧创建一个新的`Button `控件。 使用`if-else`条件语句提供指示地标是否为收藏的不同图像。

```swift
import SwiftUI

struct LandmarkDetail : View {
    
    @EnvironmentObject var userData: UserData
    
    // 获取当前landmark在userData.landmarks中显示的位置
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    
    var landmark: Landmark
    
    var body: some View {
        
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        // 按钮的事件回调
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()

                    }) {
                        // 这里设置 button 上显示的内容，根据用户是否收藏这个landmark处理显示结果
                        if self.userData.landmarks[landmarkIndex].isFavorite {
                            // 收藏了
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                        else {
                            // 未收藏
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
    }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
#endif

```

在按钮的动作闭包中，代码使用具有`userData`对象的l`andmarkIndex`来更新landmark。

- 3.在`LandmarkList.swift`中，打开实时预览。

当我们从列表导航到详细信息并点击按钮时，我们应该会在返回列表时看到这些更改仍然存在。 由于两个视图都在环境中访问相同的模型对象，因此这两个视图保持一致性。

### 测试对以上学习的理解

- 1.以下哪项在视图层次结构中向下传递数据？

可选项：
A.   `@EnvironmentObject`属性。
B.   `environmentObject(_ :)`修饰符。

答案：B

- 2.绑定的作用是什么？

可选项：
A.  它是一个值，也是一种改变该值的方法。
B.  这是将一对视图链接在一起以确保它们接收到相同的数据的一种方法。
C.  这是一种临时冻结值的方法，以便在状态转换期间其他视图不会更新。

答案：A





