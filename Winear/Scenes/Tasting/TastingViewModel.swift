//
//  TastingViewModel.swift
//  Winear
//
//  Created by Gabriel Tondin on 25/05/2021.
//

import Foundation
import WinearDataSource

public struct TastingRequest {
    let pageNumber: Int
    
    func getPageNumber() -> Int {
        return pageNumber
    }
}

public struct TastingResponse {
    let viewModel: TastingViewModel
}

struct TastingModel {
    let id: Int
    let title: String
}

struct TastingViewModel {
    var tasgings: [TastingDTO]
}
