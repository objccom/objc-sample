//
//  LandmarkList.swift
//  02-Building-Lists-and-Navigation
//
//  Created by swae on 2019/6/9.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        // 添加导航容器
        NavigationView {
            List(landmarkData) { landmark in
                // 当前列表页的视图点击跳转的事件
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
        // 在画布中添加对多个设备的预览
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            LandmarkList()
                // 添加支持的设备的大小预览画布
                .previewDevice(PreviewDevice(rawValue: deviceName))
                // 将设备名称添加为预览的标签。
                .previewDisplayName(deviceName)
        }
        
    }
}
#endif
