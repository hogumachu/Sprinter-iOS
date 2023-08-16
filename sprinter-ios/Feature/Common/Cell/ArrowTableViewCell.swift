//
//  ArrowTableViewCell.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit
import SnapKit

struct ArrowTableViewCellModel {
    
    let title: String
    let description: String?
    let inset: UIEdgeInsets
    
    init(title: String, description: String?, inset: UIEdgeInsets = .left(20)) {
        self.title = title
        self.description = description
        self.inset = inset
    }
    
}

final class ArrowTableViewCell: BaseTableViewCell {
    
    private let contentStackView = UIStackView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let descriptionLabel = UILabel(frame: .zero)
    private let arrowContainerView = UIView(frame: .zero)
    private let arrowImageView = UIImageView(frame: .zero)
    
    @discardableResult
    func configure(_ model: ArrowTableViewCellModel) -> Self {
        titleLabel.text(model.title)
        
        descriptionLabel
            .text(model.description)
            .isHidden(model.description.isEnabled == false)
        
        contentStackView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(model.inset)
        }
        
        return self
    }
    
    override func setupLayout() {
        arrowContainerView
            .registerSuperView(contentView)
            .snp.makeConstraints { make in
                make.size.equalTo(50)
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().inset(20)
            }
        
        arrowImageView
            .registerSuperView(arrowContainerView)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        contentStackView
            .registerSuperView(contentView)
            .snp.makeConstraints { make in
                make.trailing.equalTo(arrowContainerView.snp.leading).offset(-10)
                make.top.bottom.equalToSuperview()
                make.leading.equalToSuperview().inset(20)
            }
        
        contentStackView
            .appendArrangedSubView(titleLabel)
            .appendArrangedSubView(descriptionLabel)
    }
    
    override func setupAttributes() {
        backgroundColor(.black)
            .selectionStyle(.none)
        
        contentStackView
            .axis(.vertical)
            .spacing(5)
            .alignment(.leading)
        
        titleLabel
            .textColor(.white)
            .font(.extraLargeR)
            .lineBreakStrategy(.hangulWordPriority)
        
        descriptionLabel
            .textColor(.white)
            .font(.mediumR)
            .numberOfLines(0)
            .lineBreakStrategy(.hangulWordPriority)
        
        arrowContainerView
            .backgroundColor(.white)
            .cornerRadius(50 / 2)
    }
    
}
