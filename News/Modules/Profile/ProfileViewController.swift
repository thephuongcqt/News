//
//  ProfileViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

final class ProfileViewController: UIViewController {
    private let containerView = UIView()
    private let usernameLabel = UILabel()
    private let tagView = TagView()
    private let viewModel: ProfileViewModel
    private let bag = DisposeBag()
    
    init(viewModel: ProfileViewModel = ProfileViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let mainView = UIScrollView()
        mainView.addSubview(containerView)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(tagView)
        view = mainView
        
        visualize()
        setupConstraints()
        bind()
    }
    
    private func visualize() {
        edgesForExtendedLayout = []
        title = L10n.tabbarProfileTitle
        view.backgroundColor = ColorName.white.color
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.bottom.equalToSuperview().priority(.low)
        }
        
        usernameLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalToSuperview().offset(16)
            maker.trailing.equalToSuperview().offset(-16)
        }
        
        tagView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalTo(usernameLabel.snp.bottom).offset(16)
            maker.trailing.equalToSuperview().offset(-16)
            maker.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func bind() {
        let input = ProfileViewModel.Input(keyword: tagView.rx.selectedKeyword)
        let output = viewModel.transform(input: input)
        
        if let username = output.user?.username {
            usernameLabel.text = "Welcome, \(username)"
        }
        if let keyword = output.user?.category {
            tagView.setSelectedKeyword(keyword)
        }
        
        output.updateUserStream.subscribe().disposed(by: bag)
    }
}
