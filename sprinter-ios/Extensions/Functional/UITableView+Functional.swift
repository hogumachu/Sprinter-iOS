//
//  UITableView+Functional.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit

extension UITableView {
    
    @discardableResult
    func setDelegate(_ delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func setDataSource(_ dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func registerCell<T: UITableViewCell>(_ cell: T.Type) -> Self {
        self.register(cell)
        return self
    }
    
    
    
    
}
