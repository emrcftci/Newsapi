//
//  ResourcesController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourcesDisplayLogic: class {
    func displayReloadTableView()
    func displayFailureAlert()
}

final class ResourcesController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ResourcesBusinessLogic?
    var router: (ResourcesRoutingLogic & ResourcesDataPassing)?
    
    private let refreshControl = UIRefreshControl()

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
        fetchResources()
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
        setRefreshControlAction()
    }
    
    func setRefreshControlAction() {
        refreshControl.addTarget(self, action: #selector(didRefreshControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func didRefreshControlValueChanged(_ sender: Any) {
        fetchResources()
    }
    
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        let resourcesCell = UINib(nibName: Constants.Identifiers.ResourcesCellIdentifier, bundle: nil)
        tableView.register(resourcesCell, forCellReuseIdentifier: Constants.Identifiers.ResourcesCellIdentifier)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .blue
        title = "Kaynaklar"
    }
    
    func fetchResources() {
        let requestModel = Resources.GetResources.RequestModel.self
        interactor?.fetchResources(request: requestModel)
    }
}

// MARK: - ResourcesDisplayLogic

extension ResourcesController: ResourcesDisplayLogic {
    func displayReloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func displayFailureAlert() {
        router?.routeToFailureAlert()
    }
}

// MARK: - UITableViewDataSource

extension ResourcesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return router?.dataStore?.sources?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.ResourcesCellIdentifier, for: indexPath) as? ResourcesCell else { return UITableViewCell() }
        
        if let resourcesList = router?.dataStore?.sources {
            let model = resourcesList[indexPath.row]
            cell.customize(with: model)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail()
    }
    
}
