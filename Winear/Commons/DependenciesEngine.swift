//
//  Storyboarded.swift
//  Winear
//
//  Created by Gabriel Tondin on 26/05/2021.
//

import UIKit

protocol DependencieEngineProtocol {
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Compoment>(type: Compoment.Type) -> Compoment?
}

final class DependenciesEngine: DependencieEngineProtocol {
    static let shared = DependenciesEngine()
    
    private init() {}
    
    var components = [String: Any]()
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Compoment>(type: Compoment.Type) -> Compoment? {
        return components["\(type)"] as? Compoment
    }
}
