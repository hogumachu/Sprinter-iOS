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
    
}
