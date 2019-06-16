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
}

protocol ResourceDetailDataStore: class {
    var sourceDetail: [ResourceDetail.GetResourceDetail.Article]? { get set }
    var resourceId: String? { get set }
}

class ResourceDetailInteractor: ResourceDetailBusinessLogic, ResourceDetailDataStore {
    
    var presenter: ResourceDetailPresentationLogic?
    var worker = ResourceDetailWorker()
    
    var sourceDetail: [ResourceDetail.GetResourceDetail.Article]?
    var resourceId: String?
    
    func fetchResourceDetail(request: ResourceDetail.GetResourceDetail.RequestModel.Type) {
        
        worker.getSourceDetail(with: resourceId ?? "") { [weak self] response in
            guard let self = self else { return }
            
            self.sourceDetail = response?.articles
            
            guard let sourceNews = self.sourceDetail else {
                // TODO: Call presenter's failure message
                return
            }
            
            // TODO: - Call presenter's reload action for tableView
            
            
        }
    }

}
