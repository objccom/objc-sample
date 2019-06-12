//
//  LandmarkList.swift
//  03-Handling-User-Input
//
//  Created by xiaoyuan on 2019/6/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

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
