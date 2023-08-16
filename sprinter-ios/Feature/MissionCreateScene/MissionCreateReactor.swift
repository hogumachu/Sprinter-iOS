//
//  MissionCreateReactor.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import Foundation
import RxSwift
import ReactorKit

final class MissionCreateReactor: Reactor {
    
    struct Dependency {
        let router: AppRouterType
    }
    
    struct State {
        
    }
    
    enum Action {
        case addButtonDidTap
        case backButtonDidTap
    }
    
    enum Mutation {
        
    }
    
    var initialState = State()
    let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .addButtonDidTap:
            return .empty()
            
        case .backButtonDidTap:
            dependency.router.close(using: .pop, animated: true, completion: nil)
            return .empty()
        }
    }
    
}
