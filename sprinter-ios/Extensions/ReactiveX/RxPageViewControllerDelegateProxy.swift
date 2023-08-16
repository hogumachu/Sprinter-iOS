//
//  RxPageViewControllerDelegateProxy.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

extension UIPageViewController: HasDelegate {
    public typealias Delegate = UIPageViewControllerDelegate
}

open class RxPageViewControllerDelegateProxy: DelegateProxy<UIPageViewController, UIPageViewControllerDelegate>, DelegateProxyType {
    
    public weak private(set) var pageViewController: UIPageViewController?
    
    public init(pageViewController: ParentObject) {
        self.pageViewController = pageViewController
        super.init(parentObject: pageViewController, delegateProxy: RxPageViewControllerDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxPageViewControllerDelegateProxy(pageViewController: $0) }
    }
    
    private var _didFinishAnimathingPublishSubject: PublishSubject<Bool>?
    
    internal var didFinishAnimathingPublishSubject: PublishSubject<Bool> {
        if let subject = _didFinishAnimathingPublishSubject {
            return subject
        }
        let subject = PublishSubject<Bool>()
        _didFinishAnimathingPublishSubject = subject
        return subject
    }
    
    deinit {
        if let subject = _didFinishAnimathingPublishSubject {
            subject.on(.completed)
        }
    }
    
}

extension RxPageViewControllerDelegateProxy: UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let subject = _didFinishAnimathingPublishSubject {
            subject.on(.next(finished))
        }
    }
    
}
