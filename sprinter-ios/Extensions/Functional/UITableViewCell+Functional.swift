//
//  UITableViewCell+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UITableViewCell {
    
    @discardableResult
    func selectionStyle(_ style: UITableViewCell.SelectionStyle) -> Self {
        selectionStyle = style
        return self
    }
    
}
