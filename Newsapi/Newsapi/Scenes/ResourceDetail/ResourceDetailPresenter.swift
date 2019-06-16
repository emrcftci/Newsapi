//
//  ResourceDetailPresenter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourceDetailPresentationLogic: class {
    func presentResourceName(response: ResourceDetail.SetPageTitle.Response)
    func presentFailureAlert()
    func presentReloadTableView()
    func presentNewsOnSafari()
}

final class ResourceDetailPresenter: ResourceDetailPresentationLogic {

    weak var viewController: ResourceDetailDisplayLogic?
    
    func presentResourceName(response: ResourceDetail.SetPageTitle.Response) {
        let viewModel = ResourceDetail.SetPageTitle.ViewModel(resourceName: response.resourceName)
        viewController?.displayResourceName(viewModel: viewModel)
    }
    
    func presentFailureAlert() {
        viewController?.displayFailureAlert()
    }
    
    func presentReloadTableView() {
        viewController?.displayReloadTableView()
    }
    
    func presentNewsOnSafari() {
        viewController?.displaySafari()
    }
}
