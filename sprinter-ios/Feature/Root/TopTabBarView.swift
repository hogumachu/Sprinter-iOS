//
//  TopTabBarView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import RxSwift
import RxCocoa

protocol TopTabBarViewDelegate: AnyObject {
    
    func topTabBarViewDidSelectAt(_ view: TopTabBarView, at index: Int, item: TopTabBarItem)
    
}

struct TopTabBarItem: Equatable {
    
    let title: String
    
}

final class TopTabBarLabel: UILabel {
    
    var item: TopTabBarItem!
    
    var isSelected: Bool = false {
        didSet { updateSelection() }
    }
    
    init(item: TopTabBarItem) {
        self.item = item
        super.init(frame: .zero)
        setupItem(item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func setupItem(_ item: TopTabBarItem) -> Self {
        self.item = item
        return text(item.title)
    }
    
    private func updateSelection() {
        if isSelected {
            textColor(.white)
                .attributedText(item.title.underLine)
        } else {
            textColor(.sGray2)
                .attributedText(NSMutableAttributedString(string: item.title))
        }
    }
    
}

final class TopTabBarView: UIView {
    
    weak var delegate: TopTabBarViewDelegate?
    
    var currentIndex: Int = 0
    
    fileprivate let labelTapRelay = PublishRelay<Int>()
    private var disposeBag = DisposeBag()
    private var labels: [TopTabBarLabel] = []
    private let statusView = UIView(frame: .zero)
    private let scrollView = UIScrollView(frame: .zero)
    private let itemStackView = UIStackView(frame: .zero)
    private var itemSelectedBinder: Binder<UITapGestureRecognizer> {
        return Binder(self) { this, gesture in
            if let gestureView = gesture.view,
               let label = gestureView as? TopTabBarLabel,
               let index = this.index(label: label)
            {
                this.updateSelection(at: index)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSelection(at index: Int) {
        deselectAll()
        labels[safe: index]?.isSelected = true
        labelTapRelay.accept(index)
    }
    
    @discardableResult
    func addTopTabBarItem(_ item: TopTabBarItem) -> Self {
        let isSelected = labels.isEmpty
        let label = TopTabBarLabel(item: item)
            .font(.extraLargeSB)
        
        label.addTapGesture().rx.event
            .bind(to: itemSelectedBinder)
            .disposed(by: disposeBag)
        
        label.isSelected = isSelected
        labels.append(label)
        itemStackView.addArrangedSubview(label)
        return self
    }
    
    @discardableResult
    func setDelegate(_ delegate: TopTabBarViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    private func deselectAll() {
        labels.forEach { $0.isSelected = false }
    }
    
    private func index(label: TopTabBarLabel) -> Int? {
        return labels.enumerated().first(where: { $0.element.item == label.item })?.offset
    }
    
    private func setupLayout() {
        statusView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.bottom.equalTo(safeArea.top)
            }
        
        scrollView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalTo(statusView.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }
        
        itemStackView.registerSuperView(scrollView)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
    }
    
    private func setupAttributes() {
        statusView.backgroundColor(.black)
        
        scrollView.backgroundColor(.black)
            .contentInset(.left(20))
        
        itemStackView.backgroundColor(.black)
            .axis(.horizontal)
            .spacing(30)
            .alignment(.leading)
    }
    
}

extension Reactive where Base: TopTabBarView {
    
    var itemSelected: ControlEvent<Int> {
        let source = base.labelTapRelay.asObservable()
        return ControlEvent(events: source)
    }
    
}
