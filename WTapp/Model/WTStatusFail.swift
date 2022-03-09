//
//  GCStatusFail.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation

struct WTStatusFail: Codable {
    let status: String?
    let error: FailError?
}

struct FailError: Codable {
    let message: FailErrorMessage?
}

struct FailErrorMessage: Codable {
    let email: String?
    let username: String?
    let token: String?
    let displayDuration: String?
    let message: String?
}
