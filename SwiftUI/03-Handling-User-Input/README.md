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


