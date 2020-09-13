//
//  TagView.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import UIKit
import SnapKit
import TagListView
import RxSwift
import RxCocoa

public let kKeywords: Set<String> = ["bitcoin", "apple", "earthquake", "animal", "crypto", "ethereum", "litecoin", "data science", "information technology"]

final class TagView: UIControl, TagListViewDelegate {
    public var selectedKeyword: String = kKeywords.first ?? ""
    private let titleLabel = UILabel()
    private let tagsView = TagListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        visualize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(tagsView)
        
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12)
            maker.top.equalToSuperview().offset(12)
            maker.trailing.equalToSuperview().offset(-12)
        }
        
        tagsView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(12)
            maker.leading.equalToSuperview().offset(12)
            maker.trailing.equalToSuperview().offset(-12)
            maker.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func visualize() {
        backgroundColor = ColorName.neutral2.color
        layer.cornerRadius = 10
        
        titleLabel.text = L10n.tagViewTitle
        titleLabel.font = FontFamily.SFProDisplay.medium.font(size: 16)
        titleLabel.textColor = ColorName.black.color
        
        tagsView.delegate = self
        tagsView.textFont = FontFamily.SFProDisplay.medium.font(size: 18)
        tagsView.marginX = 10
        tagsView.marginY = 10
        tagsView.paddingX = 15
        tagsView.paddingY = 10
        tagsView.addTags(Array(kKeywords))
        tagsView.tagBackgroundColor = ColorName.black.color.alpha(0.6)
        tagsView.tagSelectedBackgroundColor = ColorName.blueLink.color
        tagsView.cornerRadius = 10
        tagsView.isUserInteractionEnabled = true
    }
    
    @objc func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.tagViews.forEach { tag in
            tag.isSelected = tagView == tag
        }
        selectedKeyword = title
        sendActions(for: .valueChanged)
    }
    
    func setSelectedKeyword(_ keyword: String) {
        tagsView.tagViews.forEach { tag in
            if tag.titleLabel?.text == keyword {
                tag.isSelected = true
            } else {
                tag.isSelected = false
            }
        }
    }
}

extension Reactive where Base: TagView {
    var selectedKeyword: Observable<String> {
        base.rx.controlEvent(.valueChanged).map { self.base.selectedKeyword }
    }
}
