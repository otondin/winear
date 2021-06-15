//
//  MainCoordinator.swift
//  Winear
//
//  Created by Gabriel Tondin on 26/05/2021.
//

import UIKit

final class MainCoordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator]? = nil
    private let dependenciesEngine: DependenciesEngine
    
    init(navigationController: UINavigationController, dependenciesEngine: DependenciesEngine) {
        self.navigationController = navigationController
        self.dependenciesEngine = dependenciesEngine
        setupDependencies()
    }
}

private extension MainCoordinator {
    func setupDependencies() {
        dependenciesEngine.register(type: TastingViewController.self, component: TastingViewController())
        dependenciesEngine.register(type: TastingDetailsViewController.self, component: TastingDetailsViewController())
        dependenciesEngine.register(type: NewTastingViewController.self, component: NewTastingViewController())
    }
}

extension MainCoordinator: Coordinator {
    func eventOccurred(with event: CoordinatorEvent) {
        switch event {
        case .rowDidSelected:
            if var vc: UIViewController & Coordinating = dependenciesEngine.resolve(type: TastingDetailsViewController.self) {
                vc.coordinator = self
                navigationController?.pushViewController(vc, animated: true)
            }
        case .newTastingDidSelect:
            if var vc: UIViewController & Coordinating = dependenciesEngine.resolve(type: NewTastingViewController.self) {
                vc.coordinator = self
                let nav = UINavigationController(rootViewController: vc)
                navigationController?.present(nav, animated: true, completion: nil)
            }
        }
    }

    func start() {
        if var vc: UIViewController & Coordinating = dependenciesEngine.resolve(type: TastingViewController.self) {
            vc.coordinator = self
            navigationController?.viewControllers = [vc]
        }
    }
}
