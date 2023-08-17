//
//  MissionCreateInputView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MissionCreateInputView: BaseView {
    
    private let stackView = UIStackView(frame: .zero)
    private let missionLabel = UILabel(frame: .zero)
    private let missionAddButton = ActionButton(frame: .zero)
    private let disposeBag = DisposeBag()
    
    private func addMission() {
        let contentView = generateMissionTextField()
        stackView.addArrangedSubview(contentView)
        contentView.snp.makeConstraints { make in make.height.equalTo(40) }
    }
    
    private func generateMissionTextField() -> UITextField {
        return UITextField(frame: .zero)
            .placeholder("미션을 입력해주세요", color: .sGray1)
            .borderColor(.sGray1)
            .borderWidth(1)
            .cornerRadius(10)
            .leftPadding(10)
            .textColor(.white)
    }
    
    override func setupLayout() {
        missionAddButton.registerSuperView(self)
            .snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(20)
                make.bottom.equalToSuperview()
                make.height.equalTo(25)
            }
        
        missionLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview().inset(20)
            }
        
        stackView.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.equalTo(missionLabel.snp.bottom).offset(10)
                make.leading.trailing.equalToSuperview().inset(20)
                make.bottom.equalTo(missionAddButton.snp.top).offset(-10)
            }
    }
    
    override func setupAttributes() {
        stackView
            .backgroundColor(.black)
            .axis(.vertical)
            .alignment(.fill)
            .distribution(.fill)
            .spacing(10)
        
        missionLabel
            .text("미션 내용")
            .font(.mediumB)
            .textColor(.sGray1)
        
        addMission()
        
        missionAddButton
            .setStyle(.smallLine)
            .setTitle(title: "미션 추가하기", for: .normal)
            .cornerRadius(25 / 2)
        
        missionAddButton.rx.tap
            .bind(to: addButtonTapBinder)
            .disposed(by: disposeBag)
    }
    
    private var addButtonTapBinder: Binder<Void> {
        return Binder(self) { this, _ in
            this.addMission()
        }
    }
    
}
