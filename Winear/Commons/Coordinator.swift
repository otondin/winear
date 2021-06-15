//
//  Coordinator.swift
//  Winear
//
//  Created by Gabriel Tondin on 29/05/2021.
//

import UIKit

enum CoordinatorEvent {
    case rowDidSelected
    case newTastingDidSelect
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set }

    func eventOccurred(with event: CoordinatorEvent)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
