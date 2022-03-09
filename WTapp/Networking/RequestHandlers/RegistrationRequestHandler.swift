//
//  RegistrationRequestHandler.swift
//  WTapp
//
//  Created by RSL on 21/12/21.
//

import Foundation

struct RegistrationRequestHandler: RequestHandler {
    var isSignIn: Bool?
    init(_ isSignIn: Bool = false) {
        self.isSignIn = isSignIn
    }
    func authRequest(from requestParam: RequestData) -> URLRequest? {
        let urlString =  self.isSignIn == true ? APIPath.SignIn : APIPath.SignUp
        if var url = URL(string: urlString) {
            if requestParam.param.count > 0 && requestParam.requestParamType == .query {
                url = setQueryParams(parameters: requestParam.param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            if requestParam.param.count > 0 && requestParam.requestParamType == .body {
                let data = try? JSONSerialization.data(withJSONObject: requestParam.param, options: .prettyPrinted)
                urlRequest.httpBody = data
            }
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            return urlRequest
        }
        return nil
    }
}
