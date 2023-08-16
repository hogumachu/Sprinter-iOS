//
//  RootViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit

final class RootViewController: UITabBarController {
    
    private let topTabBar = TopTabBarView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarViewControllers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topTabBar.frame.size = CGSize(width: view.frame.width, height: 50 + view.safeAreaInsets.top)
        topTabBar.frame.origin.y = 0
    }
    
    private func setupTabBar() {
        tabBar.isHidden = true
        
        topTabBar.registerSuperView(view)
            .addTopTabBarItem(.init(title: "홈"))
            .addTopTabBarItem(.init(title: "미션"))
        
        topTabBar.delegate = self
    }
    
    private func setupTabBarViewControllers() {
        setViewControllers([homeViewController, missionViewController], animated: false)
    }
    
    private lazy var homeViewController: UINavigationController = {
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()
    
    private lazy var missionViewController: UINavigationController = {
        let missionViewController = MissionViewController()
        let navigationController = UINavigationController(rootViewController: missionViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()
    
}

extension RootViewController: TopTabBarViewDelegate {
    
    func topTabBarViewDidSelectedAt(_ view: TopTabBarView, at index: Int, item: TopTabBarItem) {
        selectedIndex = index
    }
    
}
