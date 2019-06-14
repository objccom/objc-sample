//
//  UserData.swift
//  Landmarks
//
//  Created by xiaoyuan on 2019/6/14.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Combine
import SwiftUI

/*
 BindableObject 在SwiftUI 中定义，是一个protocol
 用作视图模型的对象。
 */

final class UserData: BindableObject {
    // 必须实现`BindableObject`协议中必需实现的属性`didChange `，并使用`PassthroughSubject `类初始化`didChange`属性。
    var didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
    
}
