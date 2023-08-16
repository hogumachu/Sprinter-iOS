//
//  String+.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

extension String {
    
    var underLine: NSAttributedString {
        let range = NSRange(location: 0, length: count)
        let text = NSMutableAttributedString(string: self)
        text.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: range
        )
        return text
    }
    
}
