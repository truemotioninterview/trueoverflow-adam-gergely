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
    private (set) var questions: [Question] = []
    
    init(view: QuestionsView, service: QuestionServiceProtocol = QuestionService()) {
        self.view = view
        self.service = service
    }
    
}

extension QuestionPresenter: QuestionViewPresenter {
    
    func prepareForUse() {
        getUnansweredQuestionsNumber()
    }
    
    func selectQuestion(at index: Int) {
        let question = questions[index]
        view.showAnswers(for: question)
    }
}

private extension QuestionPresenter {
    
    func getUnansweredQuestionsNumber() {
        service.questions(filter: "javascript") { [weak self] (result) in
            switch result {
            case .success(let questions):
                let questions = questions.items.filter {
                    $0.isAnswered == false
                }
                
                self?.questions = questions
                self?.view.showUnansweredQuestionsNumber(questions.count)
                self?.view.updateQuestions()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
