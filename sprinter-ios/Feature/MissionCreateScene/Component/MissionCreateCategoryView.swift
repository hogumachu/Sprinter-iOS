//
//  MissionCreateCategoryView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit
import SnapKit

final class MissionCreateCategoryView: BaseView {
    
    private let categoryLabel = UILabel(frame: .zero)
    private let categoryView = CategoryView(frame: .zero)
    
    func configure(_ categories: [CategoryItem]) {
        categoryView.configure(categories)
    }
    
    override func setupLayout() {
        categoryLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
        
        categoryView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalTo(categoryLabel.snp.bottom).offset(10)
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(30)
            }
    }
    
    override func setupAttributes() {
        categoryLabel
            .text("카테고리")
            .font(.mediumB)
            .textColor(.sGray1)
        
        categoryView.itemCornerRadius = 15
    }
    
}
