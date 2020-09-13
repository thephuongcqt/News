//
//  WebViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import WebKit
import RxCocoa

final class WebViewController: UIViewController {
    private let webView = WKWebView()
    private let progressView = UIProgressView(progressViewStyle: .default)
    
    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        
        let urlRequest = URLRequest(url: url)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        webView.load(urlRequest)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let mainView = UIView()
        mainView.addSubview(webView)
        mainView.addSubview(progressView)
        view = mainView
        
        visualize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        progressView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 2)
        webView.frame = view.bounds
    }
    
    private func visualize() {
        edgesForExtendedLayout = []        
        progressView.tintColor = ColorName.blueLink.color
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { return }

        switch keyPath {
            case "estimatedProgress":
                progressView.isHidden = webView.estimatedProgress == 1
                progressView.setProgress(Float(webView.estimatedProgress), animated: false)
            case "title":
                if let title = webView.title, !title.isEmpty {
                    self.title = title
            }
            default:
                break
        }
    }
}
