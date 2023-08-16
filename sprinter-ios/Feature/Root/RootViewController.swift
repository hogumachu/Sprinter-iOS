//
//  RootViewController.swift
//  sprinter-ios
//
//  Created by 홍성준 on 2023/08/16.
//

import UIKit
import SnapKit

final class RootViewController: BaseViewController {
    
    private var currentPage = 0
    private let topTabBar = TopTabBarView(frame: .zero)
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private lazy var pageViewControllers: [UIViewController] = [
        homeViewController,
        missionViewController
    ]
    
    override func setupLayout() {
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        topTabBar.registerSuperView(view)
            .snp.makeConstraints { make in
                make.top.equalTo(view.safeArea.top)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(50)
            }
        
        pageViewController.view.registerSuperView(view)
            .snp.makeConstraints { make in
                make.top.equalTo(topTabBar.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }
    }
    
    override func setupAttributes() {
        topTabBar.addTopTabBarItem(.init(title: "홈"))
            .addTopTabBarItem(.init(title: "미션"))
            .setDelegate(self)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([homeViewController], direction: .forward, animated: true)
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
    func topTabBarViewDidSelectAt(_ view: TopTabBarView, at index: Int, item: TopTabBarItem) {
        guard currentPage != index, pageViewControllers.count > index else { return }
        guard let selectedViewController = pageViewControllers[safe: index] else { return }
        
        let direction: UIPageViewController.NavigationDirection = currentPage < index ? .forward : .reverse
        pageViewController.setViewControllers([selectedViewController], direction: direction, animated: true)
        currentPage = index
    }
    
}

extension RootViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let lastVisibleViewController = pageViewController.viewControllers?.first,
              let index = self.pageViewControllers.firstIndex(of: lastVisibleViewController) else {
            return
        }
        currentPage = index
        topTabBar.updateSelection(index: index)
    }
    
}

extension RootViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        return pageViewControllers[safe: index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.firstIndex(of: viewController), index < pageViewControllers.count - 1 else {
            return nil
        }
        return pageViewControllers[safe: index + 1]
    }
    
}
