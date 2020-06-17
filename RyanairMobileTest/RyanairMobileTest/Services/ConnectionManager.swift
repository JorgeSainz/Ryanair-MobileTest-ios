//
//  ConnectionManager.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    enum ConnectionError: Error {
        case invalidResponse(Data?, URLResponse?)
    }
    
    func get<R:Decodable>(url: URL, completion: @escaping (Result<R, Error>) -> Void){
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completion(.failure(ConnectionError.invalidResponse(data, response)))
                    return
            }

            do {
                let response = try JSONDecoder().decode(R.self, from: responseData)
                completion(.success(response))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
            
        }
        task.resume()
    }
}
