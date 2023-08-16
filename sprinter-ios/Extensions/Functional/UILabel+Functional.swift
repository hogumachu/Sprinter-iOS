//
//  UILabel+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UILabel {
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        textColor = color
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }
    
    @discardableResult
    func numberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    
    @discardableResult
    func lineBreakStrategy(_ strategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        self.lineBreakStrategy = strategy
        return self
    }
    
    @discardableResult
    func attributedText(_ text: NSAttributedString) -> Self {
        attributedText = text
        return self
    }
    
}
