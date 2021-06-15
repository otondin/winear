//
//  TastingViewController.swift
//  Winear
//
//  Created by Gabriel Tondin on 25/05/2021.
//

import UIKit

protocol TastingViewControllerInput: AnyObject {
    func showTastings(_ viewModel: TastingViewModel)
    func displaySomeError(_ message: String)
}

protocol TastingViewControllerOutput: AnyObject {
    func getTastings()
}

class TastingViewController: UITableViewController, Coordinating {
    var interactor: TastingInteractorInput?
    var coordinator: Coordinator?
    var viewModel: TastingViewModel?
    let cellIdentiier = "tastingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setup()
        getTastings()
    }
}

private extension TastingViewController {
    func configure() {
        title = "👋🏻 Hey!"
        let syncTastingsButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapSyncTastings))
        navigationItem.leftBarButtonItem = syncTastingsButton
        let newTastingButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapNewTasting))
        navigationItem.rightBarButtonItem = newTastingButton
        tableView.register(TastingViewCell.self, forCellReuseIdentifier: cellIdentiier)
    }
    
    func setup() {
        let viewController = self
        let presenter = TastingPresenter()
        let interactor = TastingInteractor()
        let worker = TastingWorker()
        viewController.interactor = interactor
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func getTastings() {
        interactor?.getTastings()
    }
}

extension TastingViewController: TastingViewControllerInput {
    func displaySomeError(_ message: String) {
        // TODO: display some error on screen
        print(message)
    }
    
    func showTastings(_ viewModel: TastingViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension TastingViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tastings = viewModel?.tasgings {
            return tastings.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentiier) as? TastingViewCell {
            if let tastings = viewModel?.tasgings {
                let tasting = tastings[indexPath.row]
                cell.textLabel?.text = tasting.title
                cell.detailTextLabel?.text = "\(tasting.id)"
            }
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
}

extension TastingViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.eventOccurred(with: .rowDidSelected)
    }
}


private extension TastingViewController {
    @objc func didTapNewTasting() {
        coordinator?.eventOccurred(with: .newTastingDidSelect)
    }
    
    @objc func didTapSyncTastings() {
        // TODO: adding an activity indicator while waiting for tastings being synced
        getTastings()
    }
}
