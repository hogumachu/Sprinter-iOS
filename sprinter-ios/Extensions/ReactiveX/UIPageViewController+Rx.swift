//
//  UIPageViewController+Rx.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIPageViewController {
    
    var didFinishAnimating: ControlEvent<Bool> {
        let source = RxPageViewControllerDelegateProxy.proxy(for: base).didFinishAnimathingPublishSubject
        return ControlEvent(events: source)
    }
    
}
