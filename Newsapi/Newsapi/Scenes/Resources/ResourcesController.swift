//
//  ResourcesController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourcesDisplayLogic: class {

}

final class ResourcesController: BaseController {
    
    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ResourcesBusinessLogic?
    var router: (ResourcesRoutingLogic & ResourcesDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ResourcesInteractor()
        let presenter = ResourcesPresenter()
        let router = ResourcesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

// MARK: - Private Helpers

private extension ResourcesController {
    func setupView() {
        setNavigationBar()
        setTableView()
    }
    
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .blue
        title = "Kaynaklar"
    }
}

// MARK: - ResourcesDisplayLogic

extension ResourcesController: ResourcesDisplayLogic {

}

// MARK: - UITableViewDelegate

extension ResourcesController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ResourcesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
