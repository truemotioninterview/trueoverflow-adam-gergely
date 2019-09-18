//
//  EndPoint.swift
//  Test1
//
//  Created by Adam Gergely on 9/13/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ParamEncoding {
    case url, json
}

protocol RequestConvertible {
    
    var url: String { get }
    var method: HttpMethod { get }
    var encoding: ParamEncoding { get }
    var params: [String: Any]? { get }
    var jsonDecoder: JSONDecoder { get }
}

extension RequestConvertible {
    
    var encoding: ParamEncoding {
        return method == .get ? .url : .json
    }
    
    var params: [String: Any]? {
        return nil
    }

    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }

}
