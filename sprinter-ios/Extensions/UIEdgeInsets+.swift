//
//  UIEdgeInsets+.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

extension UIEdgeInsets {
    
    static func top(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: inset, left: 0, bottom: 0, right: 0)
    }
    
    static func left(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: inset, bottom: 0, right: 0)
    }
    
    static func bottom(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: inset, right: 0)
    }
    
    static func right(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: inset)
    }
    
    static func vertical(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: inset, left: 0, bottom: inset, right: 0)
    }
    
    static func horizontal(_ inset: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    static func verticalHorizontal(_ verticalInset: CGFloat, horizontalInset: CGFloat) -> UIEdgeInsets {
        return .init(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
    
}
