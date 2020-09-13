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
        let newsListController = NewsListViewController()
        let personalController = PersonalizedNewsController()
        let profileController = ProfileViewController()
        
        let mainTabController = MainTabController(
            newsList: newsListController,
            personalizedNews: personalController,
            profile: profileController
        )
        
        navigationControler.setViewControllers([mainTabController], animated: false)
    }
    
    func toActicleDetail(_ article: Article) {
        let controller = ArticleDetailViewController(article: article)
        navigationControler.pushViewController(controller, animated: true)
    }
    
    func openWebView(with url: URL) {
        let controller = WebViewController(url: url)
        navigationControler.pushViewController(controller, animated: true)
    }
}

