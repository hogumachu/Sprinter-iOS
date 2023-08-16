//
//  NavigationViewButton.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

class NavigationViewButton: UIButton {
    
    var imageTintColor: UIColor = .white {
        didSet {
            self.tintColor = self.imageTintColor
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.tintColor = .sGray2
            } else {
                self.tintColor = self.imageTintColor
            }
        }
    }
    
}
