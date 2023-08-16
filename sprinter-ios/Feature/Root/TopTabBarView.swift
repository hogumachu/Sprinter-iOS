//
//  TopTabBarView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

protocol TopTabBarViewDelegate: AnyObject {
    
    func topTabBarViewDidSelectedAt(_ view: TopTabBarView, at index: Int, item: TopTabBarItem)
    
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
    
    private var labels: [TopTabBarLabel] = []
    private let statusView = UIView(frame: .zero)
    private let scrollView = UIScrollView(frame: .zero)
    private let itemStackView = UIStackView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func addTopTabBarItem(_ item: TopTabBarItem) -> Self {
        let isSelected = labels.isEmpty
        let label = TopTabBarLabel(item: item)
            .font(.extraLargeSB)
            .addTapGesture(target: self, action: #selector(labelDidTap(_:)))
        label.isSelected = isSelected
        labels.append(label)
        itemStackView.addArrangedSubview(label)
        return self
    }
    
    @objc private func labelDidTap(_ sender: UITapGestureRecognizer) {
        guard let senderView = sender.view,
              let label = senderView as? TopTabBarLabel
        else {
            return
        }
        
        labels.enumerated()
            .forEach { offset, element in
                if element.item == label.item {
                    delegate?.topTabBarViewDidSelectedAt(self, at: offset, item: element.item)
                }
                
                element.isSelected = element.item == label.item
            }
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
