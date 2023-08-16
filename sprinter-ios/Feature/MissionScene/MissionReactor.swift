//
//  MissionReactor.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import Foundation
import RxSwift
import ReactorKit

final class MissionReactor: Reactor {
    
    struct Dependency {
        let router: AppRouterType
    }
    
    struct State {
        
    }
    
    enum Action {
        case addButtonDidTap
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
            dependency.router.transition(to: .missionCreate, using: .push, animated: true, completion: nil)
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
    
}
