//
//  User.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let reputation: Int
    let userId: Int
    let userType: String
    let profileImage: String?
    let displayName: String
    let link: String?
}
