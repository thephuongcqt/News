//
//  RegisterView.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit

final class Registerview: UIView {
    private let usernameTextField = TextField()
    private let tagView = TagView()
    private let registerButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        visualize()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(usernameTextField)
        addSubview(tagView)
        addSubview(registerButton)
    }
    
    private func visualize() {
        usernameTextField.placeholder = L10n.usernameTextfieldPlaceholder
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = ColorName.neutral2.color.cgColor
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.clearButtonMode = .whileEditing
        
        registerButton.setTitle(L10n.registerButtonTitle, for: .normal)
        registerButton.setTitleColor(ColorName.white.color, for: .normal)
        registerButton.backgroundColor = ColorName.blueLink.color
        registerButton.layer.cornerRadius = 8
    }
    
    private func setupConstraints() {
        usernameTextField.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalToSuperview().offset(16 + 60)
            maker.trailing.equalToSuperview().offset(-16)
            maker.height.equalTo(44)
        }
        
        tagView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalTo(usernameTextField.snp.bottom).offset(16)
            maker.trailing.equalToSuperview().offset(-16)
        }
        
        registerButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.height.equalTo(44)
            maker.trailing.equalToSuperview().offset(-16)
            maker.bottom.equalToSuperview().offset(-16)
        }
    }
}

