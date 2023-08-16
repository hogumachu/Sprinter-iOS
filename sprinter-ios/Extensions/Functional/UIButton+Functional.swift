//
//  UIButton+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

extension UIButton {
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func contentEdgeInsets(_ inset: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = inset
        return self
    }
    
    @discardableResult
    func setTitle(title: String, for state: UIControl.State) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
}
