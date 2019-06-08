//
//  ContentView.swift
//  01-Creating-and-Combining-Views
//
//  Created by swae on 2019/6/8.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            MapView()
                // 允许地图内容扩展到屏幕的上边缘
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            CircleImage()
            // 要将图像视图叠加在地图视图的顶部，请为图像提供垂直-130个点的偏移量，并从视图底部填充-130个点。
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment:.leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    // 让 HStack 中的子控件宽度充满整个父视图
                    Spacer()
                    Text("California")
                }
            }
            // 设置间距
            .padding()
            
            // 在根`VStack`外部的底部添加一个`spacer `垫片，将内容屏幕顶部对齐。
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
