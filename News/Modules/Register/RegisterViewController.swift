//
//  RegisterViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

final class RegisterViewController: UIViewController {
    private let backgroundView = UIView()
    private let usernameTextField = TextField()
    private let tagView = TagView()
    private let registerButton = UIButton()
    private let viewModel: RegisterViewModel
    private let bag = DisposeBag()
    
    init(viewModel: RegisterViewModel = RegisterViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let mainView = UIView()
        mainView.addSubview(backgroundView)
        mainView.addSubview(usernameTextField)
        mainView.addSubview(tagView)
        mainView.addSubview(registerButton)
        view = mainView
        
        visualize()
        setupConstraints()
        bind()
    }
    
    private func visualize() {
        edgesForExtendedLayout = []
        view.backgroundColor = ColorName.white.color
        title = L10n.registerButtonTitle
        usernameTextField.placeholder = L10n.usernameTextfieldPlaceholder
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = ColorName.neutral2.color.cgColor
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.clearButtonMode = .whileEditing
        
        registerButton.setTitle(L10n.registerButtonTitle, for: .normal)
        registerButton.setTitleColor(ColorName.white.color, for: .normal)
        registerButton.setBackgroundColor(ColorName.blueLink.color, for: .normal)
        registerButton.setBackgroundColor(ColorName.black.color.alpha(0.6), for: .disabled)        
        registerButton.layer.cornerRadius = 8
        registerButton.layer.masksToBounds = true
        registerButton.isEnabled = false
    }
    
    private func setupConstraints() {
        usernameTextField.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalToSuperview().offset(16)
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
            maker.bottom.equalToSuperview().offset(-max(16, safeAreaBottomInset))
        }
    }
    
    private func bind() {        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backgroundViewDidTap)))
        let usernameObservable = usernameTextField.rx.value.orEmpty.asObservable().share()
        let keywordObservable = tagView.rx.selectedKeyword.share()
        let registerTrigger = registerButton.rx.tap.throttle(.milliseconds(300), scheduler: MainScheduler.instance)
        
        let input = RegisterViewModel.Input(
            username: usernameObservable,
            keyword: keywordObservable,
            registerTrigger: registerTrigger
        )
        let output = viewModel.transform(input: input)
        
        output.enableButton
            .asDriver(onErrorJustReturn: false)
            .drive(registerButton.rx.isEnabled)
            .disposed(by: bag)
        output.toMainTrigger
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { _ in
                Navigator.shared.showMain()
            })
            .disposed(by: bag)
    }
    
    @objc func backgroundViewDidTap() {
        _ = usernameTextField.resignFirstResponder()
    }
}

final class TextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 10, dy: 0)
    }
}
