//
//  TastingPresenter.swift
//  Winear
//
//  Created by Gabriel Tondin on 25/05/2021.
//

import Foundation

typealias TastingPresenterInput = TastingInteractorOutput
typealias TastingPresenterOutput = TastingViewControllerInput

class TastingPresenter {
    weak var viewController: TastingViewControllerInput?
}

extension TastingPresenter: TastingPresenterInput {
    func presentTastings(_ viewModel: TastingViewModel) {
        viewController?.showTastings(viewModel)
    }
    
    func presentSomeError(_ message: String) {
        viewController?.displaySomeError(message)
    }
}
