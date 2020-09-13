//
//  PersonalizedNewsViewModel.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

class PersonalizedNewsViewModel: NewsListViewModel {
    override func getService(page: Int) -> NewsService {
        let user = CoreDataManager.shared.getCurrentUser()
        let keyword = user?.category ?? ""
        return .everything(keyword: keyword, page: page)
    }
}
