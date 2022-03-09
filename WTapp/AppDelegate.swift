//
//  AppDelegate.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if #available(iOS 13.0, *){} else {
            var storyboard: UIStoryboard?
            if UI_USER_INTERFACE_IDIOM() == .phone {
                storyboard = UIStoryboard(name: "Main_iPhone", bundle: Bundle.main)
            } else if UI_USER_INTERFACE_IDIOM() == .pad {
                storyboard = UIStoryboard(name: "Main_iPad", bundle: Bundle.main)
            }
            let vc = storyboard?.instantiateInitialViewController()
            self.window?.rootViewController = vc
        }
    
        self.window?.backgroundColor = .clear
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        var config = "iPhone Configuration"
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            print("IPAD - LOADING IPAD CONFIG - \(config)")
            config = "iPad Configuration"
        }
        print("LOADING CONFIG - \(config)")
        
        return UISceneConfiguration(name: config, sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

