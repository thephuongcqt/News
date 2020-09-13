//
//  MainTabController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit

final class MainTabController: UITabBarController {
    private let newsListController: NewsListViewController
    private let personalizedNewsController: NewsListViewController
    private let profileController: ProfileViewController
    
    init(
        newsList: NewsListViewController,
        personalizedNews: NewsListViewController,
        profile: ProfileViewController
    ) {
        newsListController = newsList
        personalizedNewsController = personalizedNews
        profileController = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    private func visualize() {
        tabBar.isTranslucent = true
        tabBar.barTintColor = ColorName.white.color
        tabBar.tintColor = ColorName.blueLink.color
        tabBar.barStyle = .black
        tabBar.selectionIndicatorImage = UIImage()
        tabBar.unselectedItemTintColor = ColorName.black.color
        tabBar.backgroundColor = .clear
        
        newsListController.tabBarItem = UITabBarItem(
            title: L10n.tabbarNewsListTitle,
            image: Asset.tabHome.image,
            selectedImage: Asset.tabHome.image
        )
        personalizedNewsController.tabBarItem = UITabBarItem(
            title: L10n.tabbarPersonalizedNewsTitle,
            image: Asset.icExplorer.image,
            selectedImage: Asset.icExplorer.image
        )
        profileController.tabBarItem = UITabBarItem(
            title: L10n.tabbarProfileTitle,
            image: Asset.tabProfile.image,
            selectedImage: Asset.tabProfile.image
        )
        
        setViewControllers(
            [
                newsListController,
                personalizedNewsController,
                profileController
            ],
            animated: false
        )
    }
}
