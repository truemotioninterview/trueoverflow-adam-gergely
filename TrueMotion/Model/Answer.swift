//
//  Answer.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

struct Answer: Codable, CommentConvertible {
    
    let owner: User
    let body: String
    let answerId: Int
    let questionId: Int
    let lastActivityDate: Date
    let creationDate: Date
    let isAccepted: Bool
    
    
    var title: String? {
        return body
    }
    var imageUrl: String? {
        return owner.profileImage
    }
    
    var isAnswered: Bool {
        return isAccepted
    }
    
    var acceptionTitle: String {
        return "Accepted"
    }
    
}
