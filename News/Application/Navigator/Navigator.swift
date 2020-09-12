//
//  Navigator.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit

final class Navigator {
    static let shared = Navigator()
    
    let navigationControler = UINavigationController()
    
    lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .black
        window.rootViewController = self.navigationControler
        return window
    }()

    
    func showMain() {
        let mainTabController = MainTabController()
        
        let newsListController = NewsListViewController()
        let personalController = PersonalizedNewsController()
        let profileController = ProfileViewController()
        
        mainTabController.setViewControllers(
            [
                newsListController,
                personalController,
                profileController
            ],
            animated: false
        )
        
        navigationControler.setViewControllers([mainTabController], animated: false)
    }
}

