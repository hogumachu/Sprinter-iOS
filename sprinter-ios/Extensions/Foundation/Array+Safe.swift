//
//  Array+Safe.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import Foundation

extension Array {
    
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
}
