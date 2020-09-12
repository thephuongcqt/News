//
//  NewsListViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit

final class NewsListViewController: UIViewController {
    
    private let tableView = UITableView()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hello"
        view.backgroundColor = .red
    }
}
