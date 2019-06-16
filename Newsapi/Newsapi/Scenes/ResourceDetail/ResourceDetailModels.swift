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
            let status: String
            let totalResults: Int
            let articles: [Article]
        }
        
        struct Article: Codable {
            let author: String
            let title: String
            let urlToImage: String
            let url: String
            let publishedAt: String
        }
        
        struct ViewModel {
            
        }
        
    }
}
