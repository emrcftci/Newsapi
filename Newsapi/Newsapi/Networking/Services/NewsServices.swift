//
//  NewsServices.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

enum NewsServices: ServiceProtocol {
    
    case getSources
    case getTopHeadlines(source: String)
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var apiKey: String {
        return "17dee2eb8eee461584226aceece35139"
    }
    
    var path: String {
        switch self {
            
        case .getSources:
            return "/sources"
            
        case .getTopHeadlines(_):
            return "/top-headlines"
            
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        
        switch self {
            
        case .getSources:
            let parameters = ["apiKey": apiKey]
            return .requestParameters(parameters)
            
        case .getTopHeadlines(let sources):
            let parameters = ["sources": "\(sources)",
                              "apiKey": apiKey]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
