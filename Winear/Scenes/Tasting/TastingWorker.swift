//
//  TastingWorker.swift
//  Winear
//
//  Created by Gabriel Tondin on 29/05/2021.
//

import Foundation
import WinearDataSource

protocol TastingWorkerProtocol {
    func getTastings(request: TastingRequest, completion: (Result<TastingResponse, Error>) -> Void)
}

final class TastingWorker {
    private let dataSource: TastingServiceProtocol
    
    init(dataSource: TastingService) {
        self.dataSource = TastingService()
    }
}

extension TastingWorker: TastingWorkerProtocol {
    func getTastings(request: TastingRequest, completion: (Result<TastingResponse, Error>) -> Void) {
        let result = dataSource.getTastings(20)
        switch result {
        case .success(let data):
            let viewModel = TastingViewModel(tasgings: data)
            let response = TastingResponse(viewModel: viewModel)
            completion(.success(response))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
