//
//  NetworkServiceType.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

public protocol NetworkServiceType {
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: NetworkMethod { get }
    
    /// The headers to be used in the request.
    var headers: [String : String]? { get }
    
    var paramters: [String: Any]? { get }
}

public enum NetworkMethod {
    case get
    case post
    case put
    case delete
    
    var http: String {
        switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .put:
                return "PUT"
            case .delete:
                return "DELETE"
        }
    }
}

extension Dictionary where Key == String, Value == Any {
    var toGetParameters: String {
        var output = ""
        forEach { key, value in
            output += "\(key)=\(value)&"
        }
        return String(output.dropLast())
    }
}
