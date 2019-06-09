//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by swae on 2019/6/8.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                // 允许地图内容扩展到屏幕的上边缘
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
                        // 让 HStack 中的子控件宽度充满整个父视图
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                }
                // 设置间距
                .padding()
            
            Spacer()
            }
        .navigationBarTitle(Text(verbatim: landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
#endif
