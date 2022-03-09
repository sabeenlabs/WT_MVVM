//
//  WTAuthenticationAPI.swift
//  WTapp
//
//  Created by RSL on 21/12/21.
//

import Foundation

struct WTAuthenticationAPI {
    func signInUserAPI(param: [String: Any], completion: @escaping (WTAuthorization?, ServiceError?) -> ()) {
        let request = RegistrationRequestHandler(true).authRequest(from: RequestData(param: param))
        APILoader.shared.loadAPIRequest(requestData: request) { (model: WTAuthorization?, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
