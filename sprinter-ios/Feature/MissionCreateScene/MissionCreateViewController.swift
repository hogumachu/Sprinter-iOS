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
    
    private let navigationView = NavigationView(frame: .zero)
    private let addButton = ActionButton(frame: .zero)
    
    override func bind(reactor: MissionCreateReactor) {
        bindAction(reactor)
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
                make.bottom.equalTo(view.safeArea.bottom).offset(-20)
                make.height.equalTo(48)
            }
    }
    
    override func setupAttributes() {
        view.backgroundColor(.black)
        
        navigationView
            .backgroundColor(.black)
            .configure(.init(type: .close, title: "미션 작성", font: .mediumSB))
        
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
            .map { Reactor.Action.closeButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
}
