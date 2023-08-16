//
//  CategoryView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit

protocol CategoryViewDelegate: AnyObject {
    
    func categoryViewDidSelectAt(_ view: CategoryView, at index: Int, item: CategoryItem)
    
}

struct CategoryItem: Equatable {
    
    let title: String
    
}

final class CategoryItemView: BaseView {
    
    var item: CategoryItem!
    
    var isSelected: Bool = false {
        didSet { updateSelection() }
    }
    
    private let containerView = UIView(frame: .zero)
    private let categoryLabel = UILabel(frame: .zero)
    
    @discardableResult
    func configure(_ item: CategoryItem) -> Self {
        self.item = item
        categoryLabel.text(item.title)
        return self
    }
    
    private func updateSelection() {
        if isSelected {
            categoryLabel.font(.smallB)
                .textColor(.black)
            
            containerView.backgroundColor(.white)
                .borderColor(.white)
        } else {
            categoryLabel.font(.smallR)
                .textColor(.sGray1)
            
            containerView.backgroundColor(.black)
                .borderColor(.sGray1)
        }
    }
    
    override func setupLayout() {
        containerView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(30)
            }
        
        categoryLabel.registerSuperView(containerView)
            .snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(10)
                make.centerY.equalToSuperview()
            }
    }
    
    override func setupAttributes() {
        containerView
            .backgroundColor(.black)
            .borderColor(.sGray1)
            .borderWidth(1)
            .cornerRadius(30 / 2)
        
        categoryLabel
            .textColor(.sGray1)
            .font(.smallR)
    }
    
}

final class CategoryView: BaseView {
    
    weak var delegate: CategoryViewDelegate?
    
    private var itemViews: [CategoryItemView] = []
    private let scrollView = UIScrollView(frame: .zero)
    private let categoryStackView = UIStackView(frame: .zero)
    
    func configure(_ items: [CategoryItem]) {
        itemViews.removeAll(keepingCapacity: true)
        categoryStackView
            .arrangedSubviews
            .forEach { $0.removeFromSuperview() }
        
        items.enumerated()
            .forEach { offset, item in
                let isSelected = offset == 0
                let itemView = CategoryItemView(frame: .zero)
                    .configure(item)
                    .addTapGesture(target: self, action: #selector(itemViewDidTap(_:)))
                itemView.isSelected = isSelected
                itemViews.append(itemView)
                categoryStackView.addArrangedSubview(itemView)
            }
    }
    
    @objc private func itemViewDidTap(_ sender: UITapGestureRecognizer) {
        guard let senderView = sender.view,
              let itemView = senderView as? CategoryItemView
        else {
            return
        }
        
        itemViews.enumerated().forEach { offset, element in
            let isSelected = itemView.item == element.item
            element.isSelected = isSelected
            
            if isSelected {
                delegate?.categoryViewDidSelectAt(self, at: offset, item: itemView.item)
            }
        }
    }
    
    override func setupLayout() {
        scrollView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        categoryStackView.registerSuperView(scrollView)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
    }
    
    override func setupAttributes() {
        scrollView.backgroundColor(.black)
            .contentInset(.left(20))
        
        categoryStackView.backgroundColor(.black)
            .axis(.horizontal)
            .spacing(10)
            .alignment(.leading)
    }
    
    
}
