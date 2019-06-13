//
//  LandmarkDetail.swift
//  03-Handling-User-Input
//
//  Created by xiaoyuan on 2019/6/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

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
