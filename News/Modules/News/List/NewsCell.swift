//
//  NewsCell.swift
//  News
//
//  Created by Nguyen The Phuong on 9/12/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class NewsCell: UITableViewCell, Reusable {
    private let thumbnailImageView = UIImageView()
    private let titleLabel = UILabel()
    private let sourceLabel = UILabel()
    private let publishDateLabel = UILabel()
    
    var article: Article? {
        didSet {
            thumbnailImageView.kf.setImage(with: URL(string: article?.urlToImage ?? ""))
            titleLabel.text = article?.title
            sourceLabel.text = article?.source.name
            publishDateLabel.text = article?.publishedDate?.rssString
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        visualize()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(sourceLabel)
        addSubview(publishDateLabel)
    }
    
    private func visualize() {
        thumbnailImageView.backgroundColor = ColorName.neutral2.color
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.layer.masksToBounds = true
        
        titleLabel.numberOfLines = 3
        titleLabel.font = FontFamily.SFProDisplay.medium.font(size: 15)
        titleLabel.textColor = ColorName.black.color
        
        sourceLabel.font = FontFamily.SFProDisplay.regular.font(size: 12)
        sourceLabel.textColor = ColorName.black.color.alpha(0.6)
                
        publishDateLabel.font = FontFamily.SFProDisplay.regular.font(size: 12)
        publishDateLabel.textColor = ColorName.black.color.alpha(0.6)
        publishDateLabel.textAlignment = .right
    }
    
    private func setupConstraints() {
        thumbnailImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalToSuperview().offset(12)
            maker.width.equalToSuperview().dividedBy(3)
            maker.height.equalTo(thumbnailImageView.snp.width).multipliedBy(3.0 / 4.0)
            maker.bottom.lessThanOrEqualToSuperview().offset(-12)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            maker.top.equalTo(thumbnailImageView.snp.top)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        sourceLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(titleLabel.snp.leading)
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
            maker.width.lessThanOrEqualToSuperview().dividedBy(3)
        }
        
        publishDateLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(sourceLabel.snp.trailing).offset(5)
            maker.top.equalTo(sourceLabel.snp.top)
            maker.trailing.equalToSuperview().offset(-12)
        }
    }
}
