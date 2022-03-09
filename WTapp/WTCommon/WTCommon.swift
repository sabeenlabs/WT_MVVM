//
//  WTCommon.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation
func postNotification(_ name: String, _ userInfo: [String: String]) {
    NotificationCenter.default.post(name: Notification.Name(name),object:nil,userInfo: userInfo)
}

enum UserDefaultKeys: String {
    case logIn
    case userDetail
    case authToken
}
