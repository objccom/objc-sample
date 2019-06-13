//
//  UserData.swift
//  03-Handling-User-Input
//
//  Created by swae on 2019/6/12.
//  Copyright © 2019 xiaoyuan. All rights reserved.
//

import Combine
import SwiftUI

/*
 BindableObject 在SwiftUI 中定义，是一个protocol
 用作视图模型的对象。
 */


final class UserData: BindableObject  {
    // 必须实现`BindableObject`协议中必需实现的属性`didChange `，并使用`PassthroughSubject `类初始化`didChange`属性。
    let didChange = PassthroughSubject<UserData, Never>()
    
    // 添加`showFavoritesOnly`和landmarks的存储属性及其初始值。
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
