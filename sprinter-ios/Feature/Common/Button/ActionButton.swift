//
//  ActionButton.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

enum ActionButtonStyle {
    
    case normal
    case secondary
    case line
    
    case smallLine
    
    var textColor: UIColor {
        switch self {
        case .normal: return .black
        case .secondary: return .white
        case .line: return .mint1
        case .smallLine: return .mint1
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .normal: return .mint1
        case .secondary: return .sGray3
        case .line: return .black
        case .smallLine: return .black
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .normal: return .white.withAlphaComponent(0.05)
        case .secondary: return .white.withAlphaComponent(0.05)
        case .line: return .mint1
        case .smallLine: return .mint1
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .line: return 2
        default: return 1
        }
    }
    
    var font: UIFont {
        switch self {
        case .line: return .mediumB
        case .smallLine: return .smallB
        default: return .mediumSB
        }
    }
    
    // MARK: - Disabled
    
    var disabledTextColor: UIColor {
        return .sGray3
    }
    
    var disabledBackgroundColor: UIColor {
        return .sGray1
    }
    
    var disabledBorderColor: UIColor {
        return .white.withAlphaComponent(0.05)
    }
    
    var disabledFont: UIFont {
        switch self {
        case .smallLine: return .smallSB
        default: return .mediumSB
        }
    }
    
    var disabledBorderWidth: CGFloat {
        return 1
    }
    
}

final class ActionButton: UIButton {
    
    var style: ActionButtonStyle = .normal {
        didSet {
            updateFont()
            updateTextColor()
            updateBackgroundColor()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            pressedView.isHidden = !isHighlighted
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
            updateFont()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAttributes()
        setupPressedView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func setStyle(_ style: ActionButtonStyle) -> Self {
        self.style = style
        return self
    }
    
    private func setupAttributes() {
        borderColor(style.borderColor)
            .borderWidth(style.borderWidth)
            .clipsToBounds(true)
            .backgroundColor(style.backgroundColor)
            .titleColor(style.textColor, for: .normal)
            .titleColor(style.disabledTextColor, for: .disabled)
            .contentEdgeInsets(.verticalHorizontal(10, horizontalInset: 20))
    }
    
    private func setupPressedView() {
        addSubview(pressedView)
        pressedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pressedView
            .backgroundColor(.white.withAlphaComponent(0.2))
            .isUserInteractionEnabled(false)
            .isHidden(true)
    }
    
    private func updateFont() {
        titleLabel?.font(isEnabled ? style.font : style.disabledFont)
    }
    
    private func updateTextColor() {
        titleColor(style.textColor, for: .normal)
            .titleColor(style.disabledTextColor, for: .disabled)
    }
    
    private func updateBackgroundColor() {
        backgroundColor(style.backgroundColor)
            .borderColor(style.borderColor)
            .borderWidth(style.borderWidth)
        
        if isHighlighted {
            pressedView.isHidden = !isHighlighted
        }
        
        if isEnabled == false {
            backgroundColor(style.disabledBackgroundColor)
                .borderColor(style.disabledBorderColor)
                .borderWidth(style.disabledBorderWidth)
        }
    }
    
    private let pressedView = UIView(frame: .zero)
    
}
