//
//  PersonalizedNewsController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit


final class PersonalizedNewsController: UIViewController {
    override func loadView() {
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Personalized"
        view.backgroundColor = .lightGray
    }
}
