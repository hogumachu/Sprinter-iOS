//
//  SceneFactory.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

enum Scene {
    case root
    case home
    case mission
    case missionCreate
}

protocol SceneFactoryType {
    func create(scene: Scene) -> UIViewController
}

final class SceneFactory: SceneFactoryType {
    
    private let injector: DependencyInjectorType
    
    init(injector: some DependencyInjectorType) {
        self.injector = injector
    }
    
    func create(scene: Scene) -> UIViewController {
        let router = injector.resovle(AppRouterType.self)
        
        switch scene {
        case .root:
            let reactor = RootReactor(dependency: .init(router: router))
            let viewController = RootViewController(reactor: reactor)
            let homeVC = create(scene: .home)
            let homeNavigationController = UINavigationController(rootViewController: homeVC)
            homeNavigationController.setNavigationBarHidden(true, animated: false)
            let missionVC = create(scene: .mission)
            let missionNavigationController = UINavigationController(rootViewController: missionVC)
            missionNavigationController.setNavigationBarHidden(true, animated: false)
            viewController.setupPages([
                .init(title: "홈", viewController: homeNavigationController),
                .init(title: "미션", viewController: missionNavigationController)
            ])
            return viewController
            
        case .home:
            let reactor = HomeReactor(dependency: .init(router: router))
            let viewController = HomeViewController(reactor: reactor)
            return viewController
            
        case .mission:
            let reactor = MissionReactor(dependency: .init(router: router))
            let viewController = MissionViewController(reactor: reactor)
            return viewController
            
        case .missionCreate:
            let reactor = MissionCreateReactor(dependency: .init(router: router))
            let viewController = MissionCreateViewController(reactor: reactor)
            return viewController
        }
    }
    
}
