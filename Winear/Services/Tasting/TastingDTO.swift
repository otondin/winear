//
//  TastingDTO.swift
//  Winear
//
//  Created by Gabriel Tondin on 26/05/2021.
//

import Foundation

public protocol Representable {}

public struct TastingDTO: Codable, Representable {
    public let id: Int
    public let title: String
    
    static func getMock(_ items: Int) -> [TastingDTO] {
        var mock = [TastingDTO]()
        guard items > 0 else { return mock }
        for i in 1...items {
            let dto = TastingDTO(id: i, title: "My Tasting")
            mock.append(dto)
        }
        return mock
    }
}
