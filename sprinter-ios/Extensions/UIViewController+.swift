//
//  UIViewController+.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

extension UIViewController {
    
    static var keyWindowRootViewController: UIViewController? {
        return UIApplication.keyWindow?.rootViewController
    }
    
    static var topViewController: UIViewController? {
        guard let rootViewController = UIViewController.keyWindowRootViewController else {
            return nil
        }
        
        var topViewController = rootViewController
        
        while let top = topViewController.presentedViewController {
            topViewController = top
        }
        return topViewController
    }
    
}
