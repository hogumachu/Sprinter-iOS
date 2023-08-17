//
//  Notification+.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit

extension Notification {
    
    var keyboardSize: CGRect? {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
}
