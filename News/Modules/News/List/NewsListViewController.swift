//
//  NewsListViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

final class NewsListViewController: UIViewController {
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private let indicatorView = UIActivityIndicatorView()
    private let viewModel: NewsListViewModel
    private let bag = DisposeBag()
    private var currentPage = 1
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<NewsListSection>(
        configureCell: { dataSource, tableView, indexPath, article in
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: NewsCell.self)
            cell.article = article
            return cell
        }
    )
    
    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        tableView.addSubview(refreshControl)
        tableView.addSubview(indicatorView)
        view = tableView
        visualize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()                
        bind()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        indicatorView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        indicatorView.center = view.center
    }
    
    func visualize() {
        title = L10n.tabbarNewsListTitle
        edgesForExtendedLayout = []
        view.backgroundColor = ColorName.neutral2.color
        tableView.backgroundColor = ColorName.neutral2.color
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: NewsCell.self)
        
        indicatorView.style = .whiteLarge
        indicatorView.color = ColorName.white.color
        indicatorView.backgroundColor = ColorName.black.color.alpha(0.6)
        indicatorView.layer.cornerRadius = 10
    }
    
    private func bind() {
        let refreshTrigger = refreshControl.rx.controlEvent(.valueChanged).asObservable()
        let loadMore = tableView.rx.contentOffset
            .flatMap { [weak self] point -> Observable<Int> in
                guard let self = self else {
                    return .empty()
                }
                let loadMoreThreshold: CGFloat = self.tableView.frame.height * 0.3
                let needToLoadMore = point.y + self.tableView.frame.height + loadMoreThreshold >= self.tableView.contentSize.height
                return needToLoadMore ? .just(self.currentPage + 1) : .empty()
            }
            .distinctUntilChanged()
        
        let input = NewsListViewModel.Input(refreshTrigger: refreshTrigger, loadMoreTrigger: loadMore)
        let output = viewModel.transform(input: input)
        
        output.loadMoreProcessing
            .doNext{ [weak self] processing in
                if !processing {
                    self?.currentPage += 1
                }
            }
            .drive(indicatorView.rx.isAnimating)
            .disposed(by: bag)
        output.refreshProcessing
            .doNext{ [weak self] processing in
                if !processing {
                    self?.currentPage = 1
                }
            }
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: bag)
        output.error
            .subscribe(onNext: { error in
                debugPrint(">> Error: \(error)")
            }).disposed(by: bag)
        output.articles
            .map { acticles in
                [NewsListSection(items: acticles)]
            }
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        tableView.rx.modelSelected(Article.self)
            .subscribeNext { article in
                Navigator.shared.toActicleDetail(article)
            }
            .disposed(by: bag)
        
        refreshControl.sendActions(for: .valueChanged)
        refreshControl.endRefreshing()
    }
}

struct NewsListSection: SectionModelType {
    var items: [Article]
    
    init(items: [Article]) {
        self.items = items
    }
    
    init(original: NewsListSection, items: [Article]) {
        self = original
        self.items = items
    }
}
