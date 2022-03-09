//
//  APILoader.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation
struct APILoader: ResponseHandler {
    static let shared = APILoader()
    var urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadAPIRequest<C:Codable>(requestData: URLRequest?, completionHandler: @escaping (C?, ServiceError?) -> ()) {
        if var urlRequest = requestData {
            //Set Auth token
            if let auth_token = UserDefaults.standard.string(forKey: "auth_token") {
               urlRequest.setValue(auth_token, forHTTPHeaderField: "Authorization")
            }
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    guard error == nil else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Error occured")", statusFailedError: nil))
                        return
                    }
                    guard let responseData = data else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Data not found")", statusFailedError: nil))
                        return
                    }
                    print("Response --- \(String(describing: try? JSONSerialization.jsonObject(with: responseData, options: [])))")
                    do {
                        let parsedResponse:C = try parseResponse(data: responseData, response: httpResponse)
                         completionHandler(parsedResponse, nil)
                    } catch let error {
                        guard let serviceError = error as? ServiceError else {
                            completionHandler(nil, nil)
                            return
                        }
                        if let _ = serviceError.statusFailedError?.error?.message?.token , serviceError.httpStatus == 1000 {
                            postNotification("tokenExpire", [:])
                        } else {
                            completionHandler(nil, serviceError)
                        }
                    }
                }
            }.resume()
        }
    }
}
