//
//  TestEndPoint.swift
//  Test1
//
//  Created by Adam Gergely on 9/13/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation

enum QuestionEndpoint: RequestConvertible {

    case openQuestionNumber
    case questions(filter: String)
    
    var url: String {
        guard var urlComponents = URLComponents(string: Constants.baseUrl) else {
            return ""
        }
        urlComponents.path = "/\(Constants.apiVersion)/search"
        switch self {
        case .openQuestionNumber:
             break
        case .questions(let filter):
            urlComponents.queryItems = [URLQueryItem(name: "intitle", value: filter),
            URLQueryItem(name: "site", value: "stackoverflow")]
        }
        
        let url =  urlComponents.string ?? ""
        print("\(url)")
        return url
        
    }
    
    var method: HttpMethod {
        return .get
    }
    

    
    
}
