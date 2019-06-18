//
//  ResourceDetailModels.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum ResourceDetail {
    
    public enum GetResourceDetail {
        
        public struct RequestModel: Codable {
            let status: String?
            let totalResults: Int?
            let articles: [Article]?
        }
        
        public struct Article: Identifiable, Codable {
            let author: String?
            let title: String?
            let urlToImage: String?
            let url: String?
            var publishedAt: String?
        }
        
        struct ViewModel {
            
        }
        
    }
    
    enum SetPageTitle {
        struct Response {
            let resourceName: String
        }
        
        struct ViewModel {
            let resourceName: String
        }
    }
    
    enum SetNewsUrl {
        struct Request {
            let indexPath: IndexPath
        }
    }
}
