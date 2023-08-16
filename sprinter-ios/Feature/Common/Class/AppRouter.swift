//
//  AppRouter.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

enum TransitionStyle {
    case modal
    case push
}

enum CloseStyle {
    case pop
    case dismiss
}

protocol AppRouterType {
    func start(root: Scene)
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool, completion: (() -> Void)?)
    func close(using style: CloseStyle, animated: Bool, completion: (() -> Void)?)
}

final class AppRouter: AppRouterType {
    
    private var currentNavigationController: UINavigationController?
    private let factory: SceneFactoryType
    
    init(factory: some SceneFactoryType) {
        self.factory = factory
    }
    
    func start(root: Scene) {
        let rootViewController = factory.create(scene: .root)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.interactivePopGestureRecognizer?.delegate = nil
        self.currentNavigationController = navigationController
        UIApplication.keyWindow?.rootViewController = navigationController
    }
    
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool, completion: (() -> Void)?) {
        guard let topViewController = UIViewController.topViewController else { return }
        currentNavigationController = topViewController as? UINavigationController ?? topViewController.navigationController
        let viewController = factory.create(scene: scene)
        
        switch style {
        case .modal:
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.interactivePopGestureRecognizer?.delegate = nil
            navigationController.modalPresentationStyle = .overFullScreen
            currentNavigationController = navigationController
            topViewController.present(navigationController, animated: animated, completion: completion)
            
        case .push:
            currentNavigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func close(using style: CloseStyle, animated: Bool, completion: (() -> Void)?) {
        switch style {
        case .pop:
            currentNavigationController?.popViewController(animated: animated)
            
        case .dismiss:
            currentNavigationController?.dismiss(animated: animated, completion: { [weak self] in
                completion?()
                let topViewController = UIViewController.topViewController!
                self?.currentNavigationController = topViewController as? UINavigationController ?? topViewController.navigationController
            })
        }
    }
    
}
