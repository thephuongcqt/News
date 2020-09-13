//
//  ProfileViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    override func loadView() {
        view = UIView()
        visualize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
    }
    
    private func visualize() {
        title = L10n.tabbarProfileTitle
    }
}
