//
//  NavigationView.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

enum NavigationViewType {
    
    case title
    case close
    case back
    
}

extension NavigationViewType {
    
    var leftImage: UIImage? {
        switch self {
        case .title: return nil
        case .back: return UIImage(systemName: "chevron.backward")
        case .close: return UIImage(systemName: "xmark")
        }
    }
    
    var leftImageTintColor: UIColor {
        return .white
    }
    
}

struct NavigationViewModel {
    
    let type: NavigationViewType
    let title: String?
    let font: UIFont?
    
    init(type: NavigationViewType, title: String?, font: UIFont?) {
        self.type = type
        self.title = title
        self.font = font
    }
    
}

final class NavigationView: BaseView {
    
    private(set) var model: NavigationViewModel?
    fileprivate let leftButton = NavigationViewButton(frame: .zero)
    fileprivate let titleLabel = UILabel(frame: .zero)
    
    @discardableResult
    func configure(_ model: NavigationViewModel) -> Self {
        self.model = model
        leftButton
            .setImage(image: model.type.leftImage, state: .normal)
            .tintColor(.white)
        
        titleLabel
            .text(model.title)
            .font(model.font)
        
        return self
    }
    
    override func setupLayout() {
        titleLabel.registerSuperView(self)
            .snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.trailing.equalToSuperview().inset(66)
            }
        
        leftButton.registerSuperView(self)
            .snp.makeConstraints { make in
                make.top.leading.bottom.equalToSuperview()
                make.width.equalTo(52)
            }
    }
    
    override func setupAttributes() {
        backgroundColor(.black)
        
        leftButton
            .tintColor(.white)
            .contentMode(.center)
            .adjustsImageWhenHighlighted(true)
        
        titleLabel
            .textColor(.white)
            .textAlignment(.center)
    }
    
}

extension Reactive where Base: NavigationView {
    
    var leftButtonTap: ControlEvent<Void> {
        let source = base.leftButton.rx.tap
        return ControlEvent(events: source)
    }
    
}
