//
//  ResourceDetailWorker.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

final public class ResourceDetailWorker {
    private let sessionProvider = URLSessionProvider()
}

// MARK: - Public Helpers

public extension ResourceDetailWorker {
    func getSourceDetail(with requestModel: ResourceDetail.GetResourceDetail.RequestModel.Type, resourceId: String, completion: @escaping ResourceDetailHandler) {
        sessionProvider.request(type: requestModel, service: NewsServices.getTopHeadlines(source: resourceId)) { response in
            
            switch response {
            case let .success(sourceDetail):
                completion(sourceDetail)
                
            case .failure(_):
                completion(nil)
            }
            
        }
    }
}
