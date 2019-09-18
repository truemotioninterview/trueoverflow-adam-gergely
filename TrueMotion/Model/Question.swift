//
//  Question.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

struct Question: Codable {
    
    let tags: [String]?
    let owner: User
    let isAnswered: Bool
    let answerCount: Int
    let score: Int
    let lastActivityDate: Date
    let creationDate: Date
    let questionId: Int
    let link: String?
    let title: String 
}
