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
        
        if let _ = CoreDataManager.shared.getCurrentUser() {
            Navigator.shared.showMain()
        } else {
            Navigator.shared.showRegister()
        }
        
        return true
    }

}

