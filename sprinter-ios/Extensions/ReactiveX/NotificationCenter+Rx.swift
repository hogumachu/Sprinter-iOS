//
//  NotificationCenter+Rx.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/17.
//

import UIKit
import RxSwift

extension Reactive where Base: NotificationCenter {
    
    var keyboardWillShow: Observable<Notification> {
        return base.rx.notification(UIResponder.keyboardWillShowNotification)
    }
    
    var keyboardWillHide: Observable<Notification> {
        return base.rx.notification(UIResponder.keyboardWillHideNotification)
    }
    
}
