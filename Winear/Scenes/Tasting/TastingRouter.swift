//
//  TastingRouter.swift
//  Winear
//
//  Created by Gabriel Tondin on 25/05/2021.
//

protocol TastingRouterProtocol {
    func routeToSomewhere()
}

class TastingRouter {
    weak var viewController: TastingViewController?
}

extension TastingRouter: TastingRouterProtocol {
    func routeToSomewhere() {
        // TODO: route to somewhere here
    }
}
