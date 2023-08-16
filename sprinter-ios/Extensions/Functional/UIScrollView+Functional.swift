//
//  UIScrollView+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

extension UIScrollView {
    
    @discardableResult
    func contentInset(_ inset: UIEdgeInsets) -> Self {
        self.contentInset = inset
        return self
    }
    
}
