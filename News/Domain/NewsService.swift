//
//  NewsService.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

public enum NewsService {
    case topHeadlines(page: Int)
    case everything(keyword: String, page: Int)
}
