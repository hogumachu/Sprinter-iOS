//
//  UITableView+Cell.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        let id = String(describing: cell)
        register(cell, forCellReuseIdentifier: id)
    }
    
    func dequeueCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let id = String(describing: cell)
        return dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
    
}
