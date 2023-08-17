//
//  CategoryView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay

final class CategoryView: BaseView {
    
    var itemCornerRadius: CGFloat = 0 {
        didSet { updateRadius() }
    }
    
    private var itemViews: [CategoryItemView] = []
    private let scrollView = UIScrollView(frame: .zero)
    private let categoryStackView = UIStackView(frame: .zero)
    fileprivate let itemTapEventRelay = PublishRelay<Int>()
    private var itemTapBinder: Binder<UITapGestureRecognizer> {
        return Binder(self) { this, gesture in
            guard let index = this.index(gesture: gesture) else { return }
            this.deselectAll()
            this.updateSelection(at: index)
            this.itemTapEventRelay.accept(index)
        }
    }
    private let disposeBag = DisposeBag()
    
    @discardableResult
    func configure(_ items: [CategoryItem]) -> Self {
        itemViews.removeAll(keepingCapacity: true)
        categoryStackView
            .arrangedSubviews
            .forEach { $0.removeFromSuperview() }
        
        items
            .enumerated()
            .forEach { offset, item in
                let isSelected = offset == 0
                let itemView = CategoryItemView(item: item)
                    .cornerRadius(itemCornerRadius)
                itemView.isSelected = isSelected
                itemViews.append(itemView)
                categoryStackView.addArrangedSubview(itemView)
                itemView.rx.tap
                    .bind(to: itemTapBinder)
                    .disposed(by: disposeBag)
            }
        return self
    }
    
    private func updateRadius() {
        itemViews.forEach { $0.cornerRadius(itemCornerRadius) }
    }
    
    private func deselectAll() {
        itemViews.forEach { $0.isSelected = false }
    }
    
    private func updateSelection(at index: Int) {
        guard let view = itemViews[safe: index] else { return }
        view.isSelected = true
    }
    
    private func index(gesture: UITapGestureRecognizer) -> Int? {
        guard let view = gesture.view, let itemView = view as? CategoryItemView else { return nil }
        return itemViews.enumerated().first(where: { $0.element == itemView })?.offset
    }
    
    override func setupLayout() {
        scrollView
            .registerSuperView(self)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        categoryStackView
            .registerSuperView(scrollView)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(scrollView)
            }
    }
    
    override func setupAttributes() {
        scrollView
            .backgroundColor(.black)
            .contentInset(.left(20))
        
        scrollView.showsHorizontalScrollIndicator = false
        
        categoryStackView
            .backgroundColor(.black)
            .axis(.horizontal)
            .spacing(10)
            .alignment(.leading)
            .distribution(.equalSpacing)
    }
    
}

extension Reactive where Base: CategoryView {
    
    var itemSelected: ControlEvent<Int> {
        let source = base.itemTapEventRelay.asObservable()
        return ControlEvent(events: source)
    }
    
}
