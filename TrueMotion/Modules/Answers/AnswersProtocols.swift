//
//  AnswersProtocols.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

protocol AnswersView: class {
    
    func update()
}

protocol AnswersViewPresenter {
    var answers: [Answer] { get }
    var question: Question { get }
    
    init(view: AnswersView, service: QuestionServiceProtocol, question: Question)
    
    func prepareForUse()
}
