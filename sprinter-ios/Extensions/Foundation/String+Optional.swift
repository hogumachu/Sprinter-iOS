//
//  String+Optional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import Foundation

extension Optional where Wrapped == String {
    
    var isEnabled: Bool {
        switch self {
        case .some(let value):
            return value.isEmpty == false
            
        case .none:
            return false
        }
    }
    
}
