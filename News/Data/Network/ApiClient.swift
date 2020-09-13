//
//  ApiClient.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class ApiClient {
    private let urlSession = URLSession.shared
    private let decoder = JSONDecoder()
    
    static let shared = ApiClient()
        
    func request<ResponseType: Codable>(for service: NetworkServiceType, type: ResponseType.Type = ResponseType.self) -> Observable<ResponseType> {
        let urlRequest = buildRequest(for: service)
        
        return urlSession.rx.data(request: urlRequest)
            .flatMap{ [weak self] data -> Observable<ResponseType> in
                guard let self = self else {
                    return .empty()
                }
                
                do {
                    let response = try self.decoder.decode(ResponseType.self, from: data)
                    return .just(response)
                } catch let error {
                    return .error(NetworkError.decodeError(error: error))
                }
            }
    }
    
    private func buildRequest(for service: NetworkServiceType) -> URLRequest {
        let url = service.baseURL.appendingPathComponent(service.path)
        var urlRequest = URLRequest(url: url)
        
        switch service.method {
            case .get:
                if let paramString = service.paramters?.toGetParameters,
                    let urlString = (service.baseURL.absoluteString + service.path + "?" + paramString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                    let newUrl = URL(string: urlString) {                                        
                    urlRequest = URLRequest(url: newUrl)
                }
            case .post, .put:
                if let params = service.paramters {
                    urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted)
                }
            default:
                debugPrint("default")
        }
        urlRequest.httpMethod = service.method.http
        urlRequest.allHTTPHeaderFields = service.headers
        return urlRequest
    }
        
}

enum NetworkError: Swift.Error {
    case urlNotFound
    case decodeError(error: Error)
    case serverError
}
