//
//  ResourceDetailController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourceDetailDisplayLogic: class {

}

final class ResourceDetailController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    var interactor: ResourceDetailBusinessLogic?
    var router: (ResourceDetailRoutingLogic & ResourceDetailDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ResourceDetailInteractor()
        let presenter = ResourceDetailPresenter()
        let router = ResourceDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

// MARK: - UITableViewDelegate

extension ResourceDetailController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ResourceDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


// MARK: - ResourceDetailDisplayLogic

extension ResourceDetailController: ResourceDetailDisplayLogic {

}