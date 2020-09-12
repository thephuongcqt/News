//
//  AppDelegate.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = Navigator.shared.window
        window?.makeKeyAndVisible()
        
        Navigator.shared.showMain()
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//
//        let rootViewController = UINavigationController(rootViewController: ViewController())
//        window?.rootViewController = rootViewController
        
        return true
    }

}

