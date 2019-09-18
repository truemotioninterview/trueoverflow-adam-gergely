//
//  QuestionTableViewCell.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier: String = "QuestionTableViewCell"

    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(_ question: Question?) {
        questionLabel.text = question?.title
    }
    
}
