//
//  CategoryItemView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay

struct CategoryItem: Equatable {
    
    let title: String
    
}

final class CategoryItemView: UIView {
    
    var item: CategoryItem
    
    var isSelected: Bool = false {
        didSet { updateSelection() }
    }
    
    private let categoryLabel = UILabel(frame: .zero)
    
    init(item: CategoryItem) {
        self.item = item
        super.init(frame: .zero)
        setupLayout()
        setupAttributes()
        categoryLabel.text(item.title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func configure(_ item: CategoryItem) -> Self {
        self.item = item
        categoryLabel.text(item.title)
        return self
    }
    
    private func updateSelection() {
        if isSelected {
            categoryLabel.font(.mediumB)
                .textColor(.black)
            
            backgroundColor(.white)
                .borderColor(.white)
        } else {
            categoryLabel.font(.mediumR)
                .textColor(.sGray1)
            
            backgroundColor(.black)
                .borderColor(.sGray1)
        }
    }
    
    private func setupLayout() {
        categoryLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalToSuperview().offset(5)
                make.bottom.equalToSuperview().offset(-5)
                make.leading.trailing.equalToSuperview().inset(15)
            }
    }
    
    private func setupAttributes() {
        backgroundColor(.black)
            .borderColor(.sGray1)
            .borderWidth(1)
        
        categoryLabel
            .textColor(.sGray1)
            .font(.mediumR)
            .textAlignment(.center)
    }
    
}

extension Reactive where Base: CategoryItemView {
    
    var tap: ControlEvent<UITapGestureRecognizer> {
        let source = base.addTapGesture().rx.event
        return ControlEvent(events: source)
    }
    
}
