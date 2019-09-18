//
//  TestEndPoint.swift
//  Test1
//
//  Created by Adam Gergely on 9/13/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation

enum QuestionEndpoint: RequestConvertible {

    case answersForQuestion(questionId: Int)
    case questions(filter: String)
    
    var url: String {
        guard var urlComponents = URLComponents(string: Constants.baseUrl) else {
            return ""
        }
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "activity")
        ]
        
        switch self {
        case .answersForQuestion(let questionId):
            urlComponents.path = "/\(Constants.apiVersion)/questions/\(questionId)/answers"
            queryParams.append(URLQueryItem(name: "filter", value: "!-*jbN0OSaa9u"))
        case .questions(let filter):
            urlComponents.path = "/\(Constants.apiVersion)/search"
            queryParams.append(URLQueryItem(name: "intitle", value: filter))
        }
        
        urlComponents.queryItems = queryParams
        let url =  urlComponents.string ?? ""
        print(url)
        return url
        
    }
    
    var method: HttpMethod {
        return .get
    }
    

    
    
}
