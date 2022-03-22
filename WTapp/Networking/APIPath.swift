//
//  APIPath.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

struct APIPath {
    //Sign
    static var SignIn: String { return "\(environment.baseURL(route: "/api/v1"))/users/sign_in"}
    static var SignUp: String { return "\(environment.baseURL(route: "/api/v1"))/users"}
    static var terms: String { return "\(environment.baseURL(route: "/api/v1"))/terms"}
    static var privacy: String { return "\(environment.baseURL(route: "/api/v1"))/privacyPolicy"}
}

enum ServerStatus: String {
    case Success = "Success"
    case fail = "fail"
}
