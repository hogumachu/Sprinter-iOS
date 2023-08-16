//
//  DependencyInjector.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import Swinject

protocol DependencyInjectorType {
    func assemble(_ assemblys: [Assembly])
    func register<T>(_ type: T.Type, _ object: T)
    func resovle<T>(_ type: T.Type) -> T
}

final class DependencyInjector: DependencyInjectorType {
    
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func assemble(_ assemblys: [Assembly]) {
        assemblys.forEach {
            $0.assemble(container: container)
        }
    }
    
    public func register<T>(_ type: T.Type, _ object: T) {
        container.register(type) { _ in
            object
        }
    }
    
    public func resovle<T>(_ type: T.Type) -> T {
        container.resolve(type)!
    }
    
}
