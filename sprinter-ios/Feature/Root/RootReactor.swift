//
//  RootReactor.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import Foundation
import RxSwift
import ReactorKit

final class RootReactor: Reactor {
    
    struct Dependency {
        let router: AppRouterType
    }
    
    struct State {
        
    }
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    var initialState = State()
    let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
}
