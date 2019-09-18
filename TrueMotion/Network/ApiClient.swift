//
//  ApiClient.swift
//  Test1
//
//  Created by Adam Gergely on 9/14/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation
import Alamofire

struct ApiClient: RequestExecutor {

    private var session: Session {
        return Alamofire.Session.default
    }
    
    
    func performRequest<T: Decodable>(_ requestConvertible: RequestConvertible, completion: @escaping (ResultType<T>) -> Void) {
        do {
            let request = try createEncodedRequest(from: requestConvertible)
            
            session.request(request).responseDecodable(decoder: requestConvertible.jsonDecoder) { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch  {
            completion(.failure(error))
        }
    }
    
    func performRequest(_ requestConvertible: RequestConvertible, completion: @escaping (ResultType<Void>) -> Void) {
        do {
            let request = try createEncodedRequest(from: requestConvertible)
            session.request(request).validate().responseString { (result) in
                completion(.success(Void()))
            }
        } catch  {
            completion(.failure(error))
        }
    }
}


// MARK: - Private methods
private extension ApiClient {
    
    func createEncodedRequest(from requestConvertible: RequestConvertible) throws -> URLRequest {
        guard let request = constructRequest(from: requestConvertible) else {
            throw ApiError.invalidUrl
        }
        return try constructParameterEncoding(from: requestConvertible).encode(request, with: requestConvertible.params)
    }
    
    func constructParameterEncoding(from requestConvertible: RequestConvertible) -> ParameterEncoding {
        var encoding: ParameterEncoding
        switch requestConvertible.encoding {
        case .json:
            encoding = JSONEncoding.default
        case .url:
            encoding = URLEncoding.default
        }
        return encoding
    }
    
    func constructRequest(from requestConvertible: RequestConvertible) -> URLRequest? {
        guard let url = URL(string: requestConvertible.url) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestConvertible.method.rawValue
        return request
        
    }
}
