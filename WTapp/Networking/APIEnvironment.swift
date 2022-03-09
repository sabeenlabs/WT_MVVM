//
//  APIEnvironment.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import Foundation

/*
 ////Production revelation system
 //#define SERVER_URL @"https://www.winningticket.com/api/v1/"
 //#define SERVER_V2 @"https://www.winningticket.com/api/v2/"
 //#define SERVER_USR @"https://www.winningticket.com/api/v1/users/"
 //#define WEB_URL @"https://www.winningticket.com"
 ////#define ACTION_CABLE @"ws://www.winningticket.com/cable"
 //#define IN_APP_url @"https://buy.itunes.apple.com/verifyReceipt"
 //#define weather_URL @"https://api.openweathermap.org/data/2.5/weather"
 //#define weather_KEY @"dc932ff4560834beb06e17d388445b65"


 //http://www.staging1.winningticket.com/

 //Stating Revelation
 #define SERVER_URL @"https://staging.winningticket.com/api/v1/"
 #define SERVER_V2 @"https://staging.winningticket.com/api/v2/"
 #define SERVER_USR @"https://staging.winningticket.com/api/v1/users/"
 //#define IMAGE_URL @"http://staging.winningticket.com"
 #define WEB_URL @"https://staging.winningticket.com"
 #define ACTION_CABLE @"ws://staging.winningticket.com/cable"
 #define IN_APP_url @"https://sandbox.itunes.apple.com/verifyReceipt"
 #define weather_URL @"https://api.openweathermap.org/data/2.5/weather"
 #define weather_KEY @"dc932ff4560834beb06e17d388445b65"
 //#define ACTION_CABLE @"ws://18.204.221.185/cable"
 */


enum APIEnvironment {
    case development
    case production

    func baseURL (route:String) -> String {
        return "https://\(subdomain()).\(domain())"+"\(route)"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "staging.winningticket.com"
        case .production:
            return "winningticket.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production:
            return "www"
        }
    }
    
//    func route() -> String {
//        return "/v1"
//    }
}
