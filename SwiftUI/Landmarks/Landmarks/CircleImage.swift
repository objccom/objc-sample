//
//  CircleImage.swift
//  Landmarks
//
//  Created by swae on 2019/6/8.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
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
        CircleImage()
    }
}
#endif
