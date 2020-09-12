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
    private let personalizedNewsController: PersonalizedNewsController
    private let profileController: ProfileViewController
    
    init(
        newsList: NewsListViewController,
        personalizedNews: PersonalizedNewsController,
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
    
    override func loadView() {
        super.loadView()
        
        visualize()
    }
    
    private func visualize() {
        newsListController.tabBarItem = UITabBarItem(
            title: L10n.tabbarNewsListTitle,
            image: Asset.icHome.image,
            selectedImage: Asset.icHome.image
        )
        personalizedNewsController.tabBarItem = UITabBarItem(
            title: L10n.tabbarPersonalizedNewsTitle,
            image: Asset.icNews.image,
            selectedImage: Asset.icNews.image
        )
        profileController.tabBarItem = UITabBarItem(
            title: L10n.tabbarProfileTitle,
            image: Asset.icNews.image,
            selectedImage: Asset.icNews.image
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
