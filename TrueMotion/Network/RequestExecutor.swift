//
//  RequestExecutor.swift
//  Test1
//
//  Created by Adam Gergely on 9/14/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation


enum ApiError: Error {
    case invalidUrl
}

typealias ResultType<T> = Result<T, Error>
protocol RequestExecutor {
    func performRequest<T: Decodable>(_ requestConvertible: RequestConvertible, completion: @escaping (ResultType<T>) -> Void)
}
