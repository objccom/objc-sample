//
//  CircleImage.swift
//  03-Handling-User-Input
//
//  Created by xiaoyuan on 2019/6/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
