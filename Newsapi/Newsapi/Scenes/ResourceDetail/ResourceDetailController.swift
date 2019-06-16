//
//  ResourceDetailController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourceDetailDisplayLogic: class {
    func displayResourceName(viewModel: ResourceDetail.SetPageTitle.ViewModel)
    func displayFailureAlert()
    func displayReloadTableView()
    func displaySafari()
}

final class ResourceDetailController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    private let refreshControl = UIRefreshControl()
    
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
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchResourceDetail()
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

// MARK: Private Helpers

private extension ResourceDetailController {
    
    func setupView() {
        interactor?.setPageTitle()
        setTableView()
        setRefreshControlAction()
    }
    
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        let resourceDetailCell = UINib(nibName: Constants.Identifiers.ResourceDetailCellIdentifier, bundle: nil)
        tableView.register(resourceDetailCell, forCellReuseIdentifier: Constants.Identifiers.ResourceDetailCellIdentifier)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
    func setRefreshControlAction() {
        refreshControl.addTarget(self, action: #selector(didRefreshControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func didRefreshControlValueChanged(_ sender: Any) {
        fetchResourceDetail()
    }
    
    func fetchResourceDetail() {
        let requestModel = ResourceDetail.GetResourceDetail.RequestModel.self
        interactor?.fetchResourceDetail(request: requestModel)
    }
}

// MARK: - UITableViewDelegate

extension ResourceDetailController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ResourceDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return router?.dataStore?.sourceDetail?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.ResourceDetailCellIdentifier, for: indexPath) as? ResourceDetailCell else {
            return UITableViewCell()
        }
        
        if let resourceDetailList = router?.dataStore?.sourceDetail {
            let model = resourceDetailList[indexPath.row]
            cell.customize(with: model)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let requestModel = ResourceDetail.SetNewsUrl.Request(indexPath: indexPath)
        interactor?.setSelectedNewsUrl(request: requestModel)
    }
    
}

// MARK: - ResourceDetailDisplayLogic

extension ResourceDetailController: ResourceDetailDisplayLogic {
    func displayResourceName(viewModel: ResourceDetail.SetPageTitle.ViewModel) {
        title = viewModel.resourceName
    }
    
    func displayFailureAlert() {
        router?.routeToFailureAlert()
    }
    
    func displayReloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func displaySafari() {
        router?.routeToSafari()
    }
}
