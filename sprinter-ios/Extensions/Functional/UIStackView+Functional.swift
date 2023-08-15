//
//  UIStackView+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UIStackView {
    
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    func customSpacing(_ spacing: CGFloat, after view: UIView) -> Self{
        self.setCustomSpacing(spacing, after: view)
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    func appendArrangedSubView(_ view: UIView) -> Self {
        self.addArrangedSubview(view)
        return self
    }
    
}
