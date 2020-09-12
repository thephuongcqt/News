//
//  NewsListViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import RxSwift

final class NewsListViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: NewsListViewModel
    private let bag = DisposeBag()
    
    init(viewModel: NewsListViewModel = NewsListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .red
        bind()
    }
    
    private func bind() {
//        let articles: Observable<ArticlesResponse> = ApiClient.shared.request(service: NewsService.topHeadlines(page: 0))
//        articles.subscribe(
//            onNext: { response in
//                debugPrint(response)
//            },
//            onError: { error in
//                debugPrint(error)
//            }
//        )
    }
}
