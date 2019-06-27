//
//  RotatedBadgeSymbol.swift
//  05-Animating-Views-and-Transitions
//
//  Created by swae on 2019/6/15.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol : View {
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#if DEBUG
struct RotatedBadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
#endif
