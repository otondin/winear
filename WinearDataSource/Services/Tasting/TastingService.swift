//
//  TastingService.swift
//  WinearDataSource
//
//  Created by Gabriel Tondin on 15/06/2021.
//

import Foundation

public protocol TastingServiceProtocol {
    func getTastings(_ pageNumber: Int) -> Result<[TastingDTO], TastingServiceError>
}

public class TastingService {
    public init() {}
}

extension TastingService: TastingServiceProtocol {
    public func getTastings(_ pageNumber: Int) -> Result<[TastingDTO], TastingServiceError> {
        // TODO: getting data from storage
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
