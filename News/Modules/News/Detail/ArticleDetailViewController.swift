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

final class ArticleDetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let authorLabel = UILabel()
    private let publishDate = UILabel()
    private let imageView = UIImageView()
    private let contentLabel = UILabel()
    private let article: Article
    
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
        view = scrollView
        
        visualize()
        setupConstraints()
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
        imageView.contentMode = .scaleAspectFill
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
            maker.bottom.equalToSuperview().offset(-12)
        }
    }
}
