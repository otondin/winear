//
//  BaseCoordinator.swift
//  Winear
//
//  Created by Gabriel Tondin on 26/05/2021.
//

import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var nabigationController: UINavigationController { get set }
    func start()
}

final class MainCoordinator {}
