//
//  ResponseHandler+Extension.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation
// MARK: Response Handler - parse default

// httpStatus - GCStatusFail -
struct ServiceError: Error,Codable {
    let httpStatus: Int
    let message: String
    let statusFailedError: WTStatusFail?
}

extension ResponseHandler {
    func defaultParseResponse<T: Codable>(data: Data, response: HTTPURLResponse) throws -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        //Check if status failed
        let failedError = try? jsonDecoder.decode(WTStatusFail.self, from: data)
        if let failedError = failedError, let _ = failedError.status, let _ = failedError.error {
            //If Status is failed send custom httpStatus 1000
            throw ServiceError(httpStatus: 1000, message: "", statusFailedError: failedError)
        } else if (200...299).contains(response.statusCode){
            do {
                let body = try jsonDecoder.decode(T.self, from: data)
                return body
                
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription, statusFailedError: nil)
                
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription, statusFailedError: nil)
                
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription, statusFailedError: nil)
                
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription, statusFailedError: nil)
            } catch {
                print("error: ", error)
                throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription, statusFailedError: nil)
            }
        } else {
            throw ServiceError(httpStatus: response.statusCode, message: "Unknown Error", statusFailedError: nil)
        }
    }
    
    func parseResponse<C: Codable>(data: Data, response: HTTPURLResponse) throws -> C  {
        return try defaultParseResponse(data: data,response: response)
    }
}
