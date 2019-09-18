//
//  QuestionsProtocols.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

protocol QuestionsView: class {
    func showUnansweredQuestionsNumber(_ number: Int)
}

protocol QuestionViewPresenter {
    
    init(view: QuestionsView, service: QuestionServiceProtocol)
    
    func prepareForUse()
}
