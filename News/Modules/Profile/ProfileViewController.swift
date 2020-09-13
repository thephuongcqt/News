//
//  ProfileViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    private let registerView = Registerview()
    
    override func loadView() {
        let mainView = UIView()
        mainView.addSubview(registerView)
        view = mainView
        visualize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorName.white.color
    }
    
    private func visualize() {
        edgesForExtendedLayout = []
        title = L10n.tabbarProfileTitle
        
        registerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
