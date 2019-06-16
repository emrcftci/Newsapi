//
//  URLSessionProvider.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

final class URLSessionProvider: ProviderProtocol {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        let request = URLRequest(service: service)
        NetworkLogger.log(request: request)
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (NetworkResponse<T>) -> Void) {
        guard error == nil else {
            return completion(.failure(.unknown))
        }
        
        guard let response = response else {
            return completion(.failure(.noJSONData))
        }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else {
                return completion(.failure(.unknown))
            }
            NetworkLogger.log(response: response, model: model, error: error)
            completion(.success(model))
            
        default:
            NetworkLogger.log(response: response, error: error)
            completion(.failure(.unknown))
        }
    }
}
