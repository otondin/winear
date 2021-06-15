//
//  TastingInteractor.swift
//  Winear
//
//  Created by Gabriel Tondin on 25/05/2021.
//

import Foundation

typealias TastingInteractorInput = TastingViewControllerOutput

protocol TastingInteractorOutput {
    func presentTastings(_ viewModel: TastingViewModel)
    func presentSomeError(_ message: String)
}

class TastingInteractor {
    var presenter: TastingPresenterInput?
    var worker : TastingWorkerProtocol?
}

extension TastingInteractor: TastingInteractorInput {
    func getTastings() {
        let request = TastingRequest(pageNumber: 50)
        worker?.getTastings(request: request) { result in
            switch result {
            case .success(let response):
                presenter?.presentTastings(response.viewModel)
            case .failure(let error):
                presenter?.presentSomeError(error.localizedDescription)
            }
        }
    }
}
