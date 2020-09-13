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

private let kFirstPage: Int = 1

class NewsListViewModel: ViewModelType {
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
            .flatMapLatest { [weak self] _ -> Observable<Event<[Article]>> in
                guard let self = self else {
                    return .empty()
                }
                return self.loadData(for: kFirstPage)
                    .materialize()
                    .trackActivity(refreshProcessing)
            }
            .share()
        let refreshError = firstPageResult.compactMap { $0.error }
        let firstPageObservable = firstPageResult.compactMap { $0.element }
        
        let loadMoreResult = input.loadMoreTrigger
            .flatMapLatest { [weak self] page -> Observable<Event<[Article]>> in
                guard let self = self else {
                    return .empty()
                }
                return self.loadData(for: page)
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
        let service = getService(page: page)
        
        return ApiClient.shared.request(for: service, type: ArticlesResponse.self)
            .flatMap { response -> Observable<[Article]> in
                if response.isSuccess {
                    return .just(response.articles)
                } else {
                    return .error(NetworkError.serverError)
                }
            }
    }
    
    func getService(page: Int) -> NewsService {
        .topHeadlines(page: page)
    }
}
