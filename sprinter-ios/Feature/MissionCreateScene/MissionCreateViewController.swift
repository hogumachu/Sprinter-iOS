//
//  MissionCreateViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

final class MissionCreateViewController: BaseViewController<MissionCreateReactor> {
    
    private var buttonBottomConstraint: Constraint?
    
    private let navigationView = NavigationView(frame: .zero)
    private let scrollView = UIScrollView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)
    private let dateView = MissionCreateDateView(frame: .zero)
    private let categoryView = MissionCreateCategoryView(frame: .zero)
    private let missionInputView = MissionCreateInputView(frame: .zero)
    private let addButton = ActionButton(frame: .zero)
    
    override func bind(reactor: MissionCreateReactor) {
        bindAction(reactor)
        bindETC(reactor)
    }
    
    override func setupLayout() {
        navigationView.registerSuperView(view)
            .snp.makeConstraints { make in
                make.top.equalTo(view.safeArea.top)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(48)
            }
        
        addButton.registerSuperView(view)
            .snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                buttonBottomConstraint =  make.bottom.equalTo(view.safeArea.bottom).offset(-10).constraint
                make.height.equalTo(48)
            }
        
        scrollView.registerSuperView(view)
            .snp.makeConstraints { make in
                make.top.equalTo(navigationView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalTo(addButton.snp.top)
                make.width.equalToSuperview()
            }
        
        stackView.registerSuperView(scrollView)
            .snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }
        
        stackView.addArrangedSubview(dateView)
        stackView.addArrangedSubview(categoryView)
        stackView.addArrangedSubview(missionInputView)
    }
    
    override func setupAttributes() {
        view.backgroundColor(.black)
        
        navigationView
            .backgroundColor(.black)
            .configure(.init(type: .back, title: "미션 작성", font: .mediumSB))
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = .bottom(40)
        
        stackView
            .backgroundColor(.black)
            .axis(.vertical)
            .alignment(.fill)
            .distribution(.fill)
            .spacing(40)
        
        categoryView
            .configure([
                .init(title: "학습"),
                .init(title: "운동"),
                .init(title: "독서"),
                .init(title: "습관"),
                .init(title: "자기계발"),
                .init(title: "기타"),
            ])
        
        addButton
            .setStyle(.normal)
            .setTitle(title: "추가하기", for: .normal)
            .cornerRadius(48 / 2)
    }
    
}

// MARK: - Bind

extension MissionCreateViewController {
    
    private func bindAction(_ reactor: MissionCreateReactor) {
        addButton.rx.tap
            .map { Reactor.Action.addButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        navigationView.rx.leftButtonTap
            .map { Reactor.Action.backButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindETC(_ reactor: MissionCreateReactor) {
        NotificationCenter.default.rx.keyboardWillShow
            .compactMap { $0.keyboardSize }
            .bind(to: keyboardShowBinder)
            .disposed(by: disposeBag)
        
        NotificationCenter.default.rx.keyboardWillHide
            .bind(to: keyboardHideBinder)
            .disposed(by: disposeBag)
    }
    
    private var keyboardShowBinder: Binder<CGRect> {
        return Binder(self) { this, keyboardSize in
            this.buttonBottomConstraint?.update(offset: -keyboardSize.height)
            UIView.animate(withDuration: 0.3) {
                this.view.layoutIfNeeded()
            }
        }
    }
    
    private var keyboardHideBinder: Binder<Notification> {
        return Binder(self) { this, _ in
            this.buttonBottomConstraint?.update(offset: -10)
            UIView.animate(withDuration: 0.3) {
                this.view.layoutIfNeeded()
            }
        }
    }
    
}
