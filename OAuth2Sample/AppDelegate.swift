//
//  AppDelegate.swift
//  OAuth2Sample
//
//  Created by Michael Bass on 12/17/18.
//  Copyright © 2018 mss. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
/*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
*/
    
    private func application(_ app: UIApplication,
                             open url: URL,
                             options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        let notification = Notification(name: Notification.Name(AGAppLaunchedWithURLNotification), object:nil, userInfo:[UIApplication.LaunchOptionsKey.url:url])
        
        NotificationCenter.default.post(notification)
        return true
    }
    
    
    
}

