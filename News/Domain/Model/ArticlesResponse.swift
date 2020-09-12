//
//  ArticlesResponse.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let code: String?
    let message: String?
    let articles: [Article]
    
    var isSuccess: Bool {
        status == "ok"
    }
}
