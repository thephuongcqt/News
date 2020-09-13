//
//  NewsListViewModel.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

private let kFirstPage: Int = 0

struct NewsListViewModel: ViewModelType {
    struct Input {
        let refreshTrigger: Observable<Void>
        let loadMoreTrigger: Observable<Int>
    }
    
    struct Output {
        let error: Observable<Error>
        let articles: Observable<[Article]>
        let refreshProcessing: Driver<Bool>
        let loadMoreProcessing: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        let refreshProcessing = ActivityIndicator()
        let loadMoreProcessing = ActivityIndicator()
        
        let firstPageResult = input.refreshTrigger
            .flatMapLatest {
                self.loadData(for: kFirstPage)
                    .materialize()
                    .trackActivity(refreshProcessing)
            }
            .share()
        let refreshError = firstPageResult.compactMap { $0.error }
        let firstPageObservable = firstPageResult.compactMap { $0.element }
        
        let loadMoreResult = input.loadMoreTrigger
            .flatMapLatest { page  in
                self.loadData(for: page)
                    .materialize()
                    .trackActivity(loadMoreProcessing)
            }
            .share()
        let loadMoreError = loadMoreResult.compactMap { $0.error }
        let loadMoreObservable = firstPageObservable
            .flatMapLatest { _ in
                loadMoreResult.compactMap { $0.element }
            }
        
        let articleObservable = firstPageObservable
            .flatMapLatest { articles -> Observable<[Article]> in
                let firstPage = Observable.just(articles)
                return Observable.concat(firstPage, loadMoreObservable)
            }
            .scan([]) { (last, new) -> [Article] in
                last + new
            }
        
        return Output(
            error: Observable.merge(refreshError, loadMoreError),
            articles: articleObservable,
            refreshProcessing: refreshProcessing.asDriver(),
            loadMoreProcessing: loadMoreProcessing.asDriver()
        )
    }
    
    private func loadData(for page: Int) -> Observable<[Article]> {
        let service = NewsService.topHeadlines(page: page)
        return ApiClient.shared.request(for: service, type: ArticlesResponse.self)
            .flatMap { response -> Observable<[Article]> in
                if response.isSuccess {
                    return .just(response.articles)
                } else {
                    return .error(NetworkError.serverError)
                }
            }
    }
}

enum NewsModelType {
    case headlines
    case customized
}
