//
//  AnswersPresenter.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

final class AnswersPresenter {
    
   
    private unowned let view: AnswersView
    private let service: QuestionServiceProtocol
    let question: Question
    private (set) var answers: [Answer] = []
    
    init(view: AnswersView, service: QuestionServiceProtocol = QuestionService(), question: Question) {
        self.view = view
        self.service = service
        self.question = question
    }
    
}

extension AnswersPresenter: AnswersViewPresenter {
    
    func prepareForUse() {
        answersForQuestion()
    }
}

private extension AnswersPresenter {
    
    func answersForQuestion() {
        service.answers(for: question.questionId) { [weak self] (result) in
            switch result {
            case .success(let answerItems):
                self?.answers = answerItems.items
                self?.view.update()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
