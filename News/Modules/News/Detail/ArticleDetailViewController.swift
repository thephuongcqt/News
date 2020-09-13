//
//  ArticleDetailViewController.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift

final class ArticleDetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let authorLabel = UILabel()
    private let publishDate = UILabel()
    private let imageView = UIImageView()
    private let contentLabel = UILabel()
    private let originNewsButton = UIButton()
    private let article: Article
    private let bag = DisposeBag()
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(authorLabel)
        containerView.addSubview(publishDate)
        containerView.addSubview(imageView)
        containerView.addSubview(contentLabel)
        containerView.addSubview(originNewsButton)
        view = scrollView
        
        visualize()
        setupConstraints()
        bind()
    }
    
    private func visualize() {
        title = article.source.name
        view.backgroundColor = ColorName.white.color
        
        titleLabel.text = article.title
        titleLabel.font = FontFamily.SFProDisplay.bold.font(size: 26)
        titleLabel.textColor = ColorName.black.color
        titleLabel.numberOfLines = 0
        
        descriptionLabel.text = article.description
        descriptionLabel.font = FontFamily.SFProDisplay.regular.font(size: 18)
        descriptionLabel.textColor = ColorName.black.color.alpha(0.6)
        descriptionLabel.numberOfLines = 0
        
        authorLabel.text = L10n.articleAuthor + (article.author ?? L10n.articleAuthorPlaceholder)
        authorLabel.font = FontFamily.SFProDisplay.medium.font(size: 13)
        authorLabel.textColor = ColorName.black.color
        authorLabel.numberOfLines = 1
        
        publishDate.text = article.publishedDate?.rssString
        publishDate.font = FontFamily.SFProDisplay.regular.font(size: 13)
        publishDate.textColor = ColorName.black.color.alpha(0.6)
        publishDate.numberOfLines = 1
        publishDate.textAlignment = .left
        
        let font = FontFamily.SFProDisplay.regular.font(size: 18)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.paragraphSpacingBefore = 15
        paragraphStyle.lineSpacing = 8
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: ColorName.black.color,
            .paragraphStyle: paragraphStyle
        ]
        contentLabel.attributedText = NSAttributedString(string: article.content ?? "", attributes: attributes)
        contentLabel.numberOfLines = 0
        
        imageView.kf.setImage(with: URL(string: article.urlToImage ?? ""))
        imageView.backgroundColor = ColorName.neutral2.color
        imageView.contentMode = .scaleAspectFill
            
        originNewsButton.setTitle(L10n.buttonOpenOriginNews, for: .normal)
        originNewsButton.setTitleColor(ColorName.blueLink.color, for: .normal)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.bottom.equalToSuperview().priority(.low)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalToSuperview().offset(12)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        authorLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        publishDate.snp.makeConstraints { maker in
            maker.leading.equalTo(authorLabel.snp.trailing).offset(12)
            maker.top.equalTo(authorLabel.snp.top)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalTo(authorLabel.snp.bottom).offset(12)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        imageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            maker.trailing.equalToSuperview()
            maker.height.equalTo(imageView.snp.width).multipliedBy(3.0 / 4.0)
        }
        
        contentLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalTo(imageView.snp.bottom).offset(12)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        originNewsButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalTo(contentLabel.snp.bottom).offset(16)
            maker.trailing.equalToSuperview().offset(-16)
            maker.height.equalTo(44)
            maker.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func bind() {
        originNewsButton.rx.tap
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribeNext { [weak self] _ in
                guard let self = self, let url = URL(string: self.article.url) else {
                    return
                }
                Navigator.shared.openWebView(with: url)
            }
            .disposed(by: bag)
    }
}
