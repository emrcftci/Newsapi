//
//  ResourceDetailInteractor.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourceDetailBusinessLogic: class {
    func fetchResourceDetail(request: ResourceDetail.GetResourceDetail.RequestModel.Type)
    func setPageTitle()
    func setSelectedNewsUrl(request: ResourceDetail.SetNewsUrl.Request)
}

protocol ResourceDetailDataStore: class {
    var sourceDetail: [ResourceDetail.GetResourceDetail.Article]? { get set }
    var resourceId: String? { get set }
    var resourceName: String? { get set }
    var errorText: String? { get set }
    var newsUrl: String? { get set }
}

class ResourceDetailInteractor: ResourceDetailBusinessLogic, ResourceDetailDataStore {
    
    var presenter: ResourceDetailPresentationLogic?
    var worker = ResourceDetailWorker()
    
    var sourceDetail: [ResourceDetail.GetResourceDetail.Article]?
    var resourceId: String?
    var resourceName: String?
    var errorText: String?
    var newsUrl: String?
    
    func fetchResourceDetail(request: ResourceDetail.GetResourceDetail.RequestModel.Type) {
        
        worker.getSourceDetail(with: request.self, resourceId: resourceId ?? "") { [weak self] response in
            guard let self = self else { return }
            self.sourceDetail = response?.articles
            self.checkDataForAction()
        }
    }
    
    func setPageTitle() {
        let responseModel = ResourceDetail.SetPageTitle.Response(resourceName: resourceName ?? "")
        presenter?.presentResourceName(response: responseModel)
    }
    
    func setSelectedNewsUrl(request: ResourceDetail.SetNewsUrl.Request) {
        let index = request.indexPath.row
        newsUrl = sourceDetail?[index].url
        
        presenter?.presentNewsOnSafari()
    }

}

// MARK: - Private Helpers

private extension ResourceDetailInteractor {
    func checkDataForAction() {
        
        if sourceDetail == nil {
            errorText = Constants.ErrorMessages.ConnectionError
            presenter?.presentFailureAlert()
            return
        }
        
        presenter?.presentReloadTableView()
        
        // TODO: - Call presenter's reload action for tableView
        
    }
}
