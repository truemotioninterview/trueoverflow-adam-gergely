//
//  QuestionPresenter.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

final class QuestionPresenter {
 
    private unowned let view: QuestionsView
    private let service: QuestionServiceProtocol
    
    init(view: QuestionsView, service: QuestionServiceProtocol = QuestionService()) {
        self.view = view
        self.service = service
    }
    
}

extension QuestionPresenter: QuestionViewPresenter {
    
    func prepareForUse() {
        getUnansweredQuestionsNumber()
    }
}

private extension QuestionPresenter {
    
    func getUnansweredQuestionsNumber() {
        service.questions(filter: "javascript") { [weak self] (result) in
            switch result {
            case .success(let questions):
                let unAnsweredCount = questions.items.filter {
                    $0.isAnswered == false
                }.count
                self?.view.showUnansweredQuestionsNumber(unAnsweredCount)
            case .failure(let error):
                print("\(error)")
            }
            
        }
    }
}
