//
//  ResourcesRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourcesRoutingLogic: class {
    func routeToDetail()
    func routeToFailureAlert()
}

protocol ResourcesDataPassing: class {
    var dataStore: ResourcesDataStore? { get }
}

final class ResourcesRouter: ResourcesRoutingLogic, ResourcesDataPassing {

    weak var viewController: ResourcesController?
    var dataStore: ResourcesDataStore?

    func routeToDetail() {
        let storyBoard = UIStoryboard(name: "ResourceDetail", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.ResourceDetailControllerIdentifier) as? ResourceDetailController {
            
            vc.router?.dataStore?.resourceId = dataStore?.selectedResourceId
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func routeToFailureAlert() {
        DispatchQueue.main.async(execute: { [weak self] in
            guard let self = self else { return }
            if let alert = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(withIdentifier: "FailureAlertController") as? FailureAlertController {
                
                alert.transitioningDelegate = alert
                alert.modalPresentationStyle = .custom
                
                alert.titleText = self.dataStore?.errorText ?? "-"
                self.viewController?.present(alert, animated: true, completion: nil)
            }
        })
    }
}
