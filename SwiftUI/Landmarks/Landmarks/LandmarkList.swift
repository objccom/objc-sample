//
//  LandmarkList.swift
//  Landmarks
//
//  Created by swae on 2019/6/9.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        // 设置导航容器
        NavigationView {
            
            List {
                
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(landmarkData) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        // 点击cell时，将当前`landmark`传递到目标`LandmarkDetail`中。
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
                // 显示当前列表页的导航标题
                    .navigationBarTitle(Text("Landmarks"))
            }
        }
        
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        // 在画布中添加对多个设备的预览
//        let devices = ["iPhone SE", "iPhone XS Max"]
        ForEach(["iPhone XS Max"].identified(by: \.self)) { deviceName in
            LandmarkList()
                // 添加支持的设备的大小预览画布
                .previewDevice(PreviewDevice(rawValue: deviceName))
                // 将设备名称添加为预览的标签。
                .previewDisplayName(deviceName)
                .environmentObject(UserData())
        }
        
        
    }
}
#endif
