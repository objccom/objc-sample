//
//  Badge.swift
//  04-Drawing-Paths-And-Shapes
//
//  Created by xiaoyuan on 2019/6/14.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct Badge : View {
    var body: some View {
        // 在`Badge.swift`中，添加一个`Path`形状到`Badge`中， 再调用这个`Path`的`fill()`方法将其转换为视图。
        Path { path in
            let width: CGFloat = 100.0
            let height = width
            path.move(to: CGPoint(x: width*0.95, y: height*0.20))
            
            HexagonParameters.points.forEach {
                path.addLine(
                    to: .init(
                        x: width * $0.useWidth.0 * $0.xFactors.0,
                        y: height * $0.useHeight.0 * $0.yFactors.0
                    )
                )
            }
        }
        .fill(Color.black)
        
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
