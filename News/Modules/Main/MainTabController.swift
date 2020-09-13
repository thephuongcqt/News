//
//  MainTabController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit

final class MainTabController: UITabBarController {
    private let topLine = UIView()
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
        tabBar.addSubview(topLine)
        visualize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        topLine.frame = CGRect(x: 0, y: -1, width: view.bounds.width, height: 1)
    }
    
    private func visualize() {
        topLine.autoresizingMask = .flexibleWidth
        topLine.backgroundColor = ColorName.black.color.alpha(0.5)
        
        title = L10n.tabbarNewsListTitle
        tabBar.isTranslucent = true
        tabBar.barTintColor = ColorName.white.color
        tabBar.tintColor = ColorName.blueLink.color
        tabBar.barStyle = .black
        tabBar.selectionIndicatorImage = UIImage()
        tabBar.unselectedItemTintColor = ColorName.black.color
        
        newsListController.tabBarItem = UITabBarItem(
            title: L10n.tabbarNewsListTitle,
            image: Asset.tabbarHome.image,
            selectedImage: Asset.tabbarHome.image
        )
        personalizedNewsController.tabBarItem = UITabBarItem(
            title: L10n.tabbarPersonalizedNewsTitle,
            image: Asset.tabbarHeart.image,
            selectedImage: Asset.tabbarHeart.image
        )
        profileController.tabBarItem = UITabBarItem(
            title: L10n.tabbarProfileTitle,
            image: Asset.tabbarProfile.image,
            selectedImage: Asset.tabbarProfile.image
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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.title
    }
}
