//
//  ContentView.swift
//  Landmarks
//
//  Created by swae on 2019/6/8.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                // 允许地图内容扩展到屏幕的上边缘
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    HStack {
                        Text("Joshua Tree National Park")
                        // 让 HStack 中的子控件宽度充满整个父视图
                        Spacer()
                        Text("California")
                    }
                }
                // 设置间距
                .padding()
            
            Spacer()
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
