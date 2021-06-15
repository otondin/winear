//
//  NewTastingViewController.swift
//  Winear
//
//  Created by Gabriel Tondin on 01/06/2021.
//

import UIKit

final class NewTastingViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension NewTastingViewController {
    func setup() {
        title = "New tasting"
        view.backgroundColor = .systemBackground
        view.frame = UIScreen.main.accessibilityFrame
        modalPresentationStyle = UIModalPresentationStyle.automatic
        navigationController?.isModalInPresentation = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
    }
    
    @objc func cancelAction() {
        dismiss(animated: true, completion: nil)
    }
}
