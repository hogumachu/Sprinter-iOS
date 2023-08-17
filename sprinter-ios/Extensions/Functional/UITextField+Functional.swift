//
//  UITextField+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit

extension UITextField {
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func placeholder(_ text: String, color: UIColor) -> Self {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
        return self
    }
    
    @discardableResult
    func leftPadding(_ padding: CGFloat) -> Self {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        return self
    }
    
}
