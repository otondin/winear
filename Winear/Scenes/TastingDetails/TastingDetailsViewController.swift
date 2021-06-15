//
//  TastingDetailsViewController.swift
//  Winear
//
//  Created by Gabriel Tondin on 29/05/2021.
//

import UIKit

final class TastingDetailsViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasting Details"
        view.backgroundColor = .systemBackground
    }
}
