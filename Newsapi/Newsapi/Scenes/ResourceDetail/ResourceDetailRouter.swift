//
//  ResourceDetailRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourceDetailRoutingLogic: class {
    func routeToSafari()
    func routeToFailureAlert()
}

protocol ResourceDetailDataPassing: class {
    var dataStore: ResourceDetailDataStore? { get }
}

final class ResourceDetailRouter: ResourceDetailRoutingLogic, ResourceDetailDataPassing {

    weak var viewController: ResourceDetailController?
    var dataStore: ResourceDetailDataStore?

    func routeToSafari() {
        let urlString = dataStore?.newsUrl ?? ""
        if let url = URL(string: urlString) {
            openSafari(with: url)
        }
    }
    
    func routeToFailureAlert() {
        if let alert = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(withIdentifier:  "FailureAlertController") as? FailureAlertController {
            
            alert.transitioningDelegate = alert
            alert.modalPresentationStyle = .custom
            
            alert.titleText = dataStore?.errorText ?? "-"
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
}

// MARK: - Private Helpers

private extension ResourceDetailRouter {
    func openSafari(with url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
