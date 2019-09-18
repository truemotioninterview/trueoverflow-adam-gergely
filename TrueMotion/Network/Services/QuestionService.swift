//
//  PostService.swift
//  Test1
//
//  Created by Adam Gergely on 9/14/19.
//  Copyright © 2019 ott-one. All rights reserved.
//

import Foundation


protocol QuestionServiceProtocol {
    
    init(requestExecutor: RequestExecutor)
    
    func questions(filter: String, completion: @escaping (ResultType<Items<Question>>) -> Void)
    func answers(for questionId: Int, completion: @escaping (ResultType<Items<Answer>>) -> Void)
}

struct QuestionService: QuestionServiceProtocol {
    
    private let requestExecutor: RequestExecutor
    
    init(requestExecutor: RequestExecutor = ApiClient()) {
        self.requestExecutor = requestExecutor
    }
    
    func questions(filter: String, completion: @escaping (ResultType<Items<Question>>) -> Void) {
        requestExecutor.performRequest(QuestionEndpoint.questions(filter: filter)) { (result: ResultType<Items<Question>>) in
            completion(result)
        }
    }
    
    func answers(for questionId: Int, completion: @escaping (ResultType<Items<Answer>>) -> Void) {
        requestExecutor.performRequest(QuestionEndpoint.answersForQuestion(questionId: questionId)) { (result: ResultType<Items<Answer>>) in
            completion(result)
        }
    }
}
