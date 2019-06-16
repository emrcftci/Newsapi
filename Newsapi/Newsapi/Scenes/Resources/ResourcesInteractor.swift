//
//  ResourcesInteractor.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourcesBusinessLogic: class {
    func fetchResources(request: Resources.GetResources.RequestModel.Type)
}

protocol ResourcesDataStore: class {
    var sources: [Resources.GetResources.Source]? { get set }
    var selectedResourceId: String? { get set }
}

class ResourcesInteractor: ResourcesBusinessLogic, ResourcesDataStore {
    
    var presenter: ResourcesPresentationLogic?
    var worker = ResourcesWorker()
    
    var sources: [Resources.GetResources.Source]?
    var selectedResourceId: String?

    func fetchResources(request: Resources.GetResources.RequestModel.Type) {
        
        worker.getResources { [weak self] response in
            guard let self = self else { return }
            self.sources = response?.sources
            
            guard let sources = self.sources else {
                // TODO: Call presenter's failure message
                return
            }
            
            // TODO: Call presenter's reload action for tableView
            
        }
        
    }
}
