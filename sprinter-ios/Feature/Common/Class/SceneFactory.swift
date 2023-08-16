//
//  SceneFactory.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit

enum Scene {
    case root
    case missionCreate
}

protocol SceneFactoryType {
    func create(scene: Scene) -> UIViewController
}

final class SceneFactory: SceneFactoryType {
    
    func create(scene: Scene) -> UIViewController {
        let router = AppRouter(factory: self)
        
        switch scene {
        case .root:
            let reactor = RootReactor()
            let viewController = RootViewController(reactor: reactor)
            return viewController
            
        case .missionCreate:
            let reactor = MissionCreateReactor()
            let viewController = MissionCreateViewController(reactor: reactor)
            return viewController
        }
    }
    
}
