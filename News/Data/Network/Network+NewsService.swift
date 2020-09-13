//
//  Network+NewsService.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

private let kBaseUrl: String = "http://newsapi.org/"
private let kPublicKey: String = "566e1e58a3f24f98b1267f9bc7af1710"
private let kPageSize: Int = 10

extension NewsService: NetworkServiceType {
    public var baseURL: URL {
        URL(string: kBaseUrl)!
    }
    
    public var path: String {
        switch self {
            case .topHeadlines:
                return "v2/top-headlines"
            case .everything:
                return "v2/everything"
        }
    }
    
    public var method: NetworkMethod {
        .get
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    public var paramters: [String : Any]? {
        switch self {
            case let .topHeadlines(page: page):
                return [
                    "pageSize": kPageSize,
                    "page": page,
                    "country": "us",
                    "apiKey": kPublicKey
                ]
            case let .everything(keyword, page):
                return [
                    "pageSize": kPageSize,
                    "q": keyword,
                    "page": page,
                    "apiKey": kPublicKey
                ]            
        }
    }
}
