//
//  MissionCreateDateView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit
import SnapKit

private class MissionDateLabelView: BaseView {
    
    let label = UILabel(frame: .zero)
    
    override func setupLayout() {
        label.registerSuperView(self)
            .snp.makeConstraints { make in
                let inset = UIEdgeInsets.verticalHorizontal(5, horizontalInset: 12)
                make.edges.equalToSuperview().inset(inset)
            }
    }
    
    override func setupAttributes() {
        label
            .textColor(.white)
            .font(.mediumSB)
    }
    
}

final class MissionCreateDateView: BaseView {
    
    private let sectionLabel = UILabel(frame: .zero)
    private let missionDayLabel = UILabel(frame: .zero)
    private let dateView = MissionDateLabelView(frame: .zero)
    
    override func setupLayout() {
        sectionLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().inset(20)
            }
        
        missionDayLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.centerY.equalTo(sectionLabel)
                make.leading.equalTo(sectionLabel.snp.trailing).offset(3)
            }
        
        dateView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalTo(sectionLabel.snp.bottom).offset(10)
                make.leading.equalToSuperview().inset(20)
                make.bottom.equalToSuperview()
                make.height.equalTo(30)
            }
        
    }
    
    override func setupAttributes() {
        self
            .backgroundColor(.black)
        
        sectionLabel
            .text("미션 기간")
            .font(.mediumB)
            .textColor(.sGray1)
        
        missionDayLabel
            .text("(총 {N}일)")
            .font(.mediumR)
            .textColor(.white)
        
        dateView
            .backgroundColor(.black)
            .borderColor(.white)
            .borderWidth(1)
            .cornerRadius(15)
        
        dateView.label
            .text("2023.08.17 ~ 2023.09.17")
    }
    
}
