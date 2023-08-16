//
//  MissionTableViewCell.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit
import SnapKit

struct MissionTableViewCellModel {
    
    let mission: String
    
}

final class MissionTableViewCell: BaseTableViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let missionLabel = UILabel(frame: .zero)
    private let categoryContainerView = UIView(frame: .zero)
    private let categoryEmojiLabel = UILabel(frame: .zero)
    
    
    @discardableResult
    func configure(_ model: MissionTableViewCellModel) -> Self {
        missionLabel.text(model.mission)
        return self
    }
    
    override func setupLayout() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            let inset = UIEdgeInsets.horizontal(20)
            make.edges.equalToSuperview().inset(inset)
        }
        
        containerView.addSubview(categoryContainerView)
        categoryContainerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(25)
        }
        
        categoryContainerView.addSubview(categoryEmojiLabel)
        categoryEmojiLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        containerView.addSubview(missionLabel)
        missionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(categoryContainerView.snp.leading).offset(-20)
        }
    }
    
    override func setupAttributes() {
        backgroundColor(.black)
            .selectionStyle(.none)
        
        containerView
            .backgroundColor(.black)
            .cornerRadius(16)
            .borderWidth(1)
            .borderColor(.white)
        
        missionLabel
            .textColor(.white)
            .font(.mediumR)
            .textAlignment(.left)
        
        categoryContainerView
            .backgroundColor(.sGray3)
            .cornerRadius(25 / 2)
        
        categoryEmojiLabel
            .font(.smallR)
            .text("✏️")
            .textAlignment(.center)
    }
    
}
