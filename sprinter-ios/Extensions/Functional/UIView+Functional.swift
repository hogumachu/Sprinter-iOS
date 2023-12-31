//
//  UIView+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UIView {
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func registerSuperView(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func addTapGesture(target: Any?, action: Selector?) -> Self {
        isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    
}
