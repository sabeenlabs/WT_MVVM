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
}

enum ServerStatus: String {
    case Success = "Success"
    case fail = "fail"
}
