//
//  BaseViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/15.
//

import UIKit
import ReactorKit

class BaseViewController<ReactorType: Reactor>: UIViewController, View {
    
    typealias Reactor = ReactorType
    var disposeBag = DisposeBag()
    
    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupAttributes()
    }
    
    func bind(reactor: ReactorType) {}
    func setupLayout() {}
    func setupAttributes() {}
    
}
