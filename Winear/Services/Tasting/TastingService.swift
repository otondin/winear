//
//  TastingService.swift
//  Winear
//
//  Created by Gabriel Tondin on 26/05/2021.
//

import Foundation

public protocol TastingServiceProtocol: AnyObject {
    func getTastings(_ pageNumber: Int) -> Result<[TastingDTO], TastingServiceError>
}

public class TastingService {
    public init() {}
}

extension TastingService: TastingServiceProtocol {
    public func getTastings(_ pageNumber: Int) -> Result<[TastingDTO], TastingServiceError> {
        // TODO: getting data from storage, instead of mock
        let data = TastingDTO.getMock(pageNumber)
        if data.count > 0 {
            return .success(data)
        } else {
            return .failure(.noData)
        }
    }
}

public enum TastingServiceError: Error {
    case noConnection
    case noData
    case invalidData
    case other
}
