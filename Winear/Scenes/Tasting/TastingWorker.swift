//
//  TastingWorker.swift
//  Winear
//
//  Created by Gabriel Tondin on 29/05/2021.
//

import Foundation

protocol TastingWorkerProtocol {
    func getTastings(request: TastingRequest, completion: (Result<TastingResponse, TastingServiceError>) -> Void)
}

final class TastingWorker {
    init() {
        setupDependencies()
    }
}

private extension TastingWorker {
    func setupDependencies() {
        DependenciesEngine.shared.register(type: TastingService.self, component: TastingService())
    }
}

extension TastingWorker: TastingWorkerProtocol {
    func getTastings(request: TastingRequest, completion: (Result<TastingResponse, TastingServiceError>) -> Void) {
        guard let dataSource = DependenciesEngine.shared.resolve(type: TastingService.self) else {
            completion(.failure(.other))
            return
        }
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
