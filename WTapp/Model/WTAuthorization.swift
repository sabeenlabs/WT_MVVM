//
//  WTAuthorization.swift
//  WTapp
//
//  Created by RSL on 21/12/21.
//

import Foundation

struct WTAuthorization: Codable {
    let message: String?
    let authenticationToken: String?
    let status: String?
    let role: String?
    let userDetails: UserDetail?
    
    func save() -> Bool {
        do {
            try UserDefaults.standard.save(object: self, forKey: UserDefaultKeys.userDetail.rawValue)
            return true
        } catch {
            print("error in saving user default \(error.localizedDescription)")
            return false
        }
    }
}

struct UserDetail: Codable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let userHandicap: String?
    let userPlayerType: String?
    let avatarUrl: String?
}
