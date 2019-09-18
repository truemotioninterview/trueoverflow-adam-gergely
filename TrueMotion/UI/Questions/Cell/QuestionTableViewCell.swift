//
//  QuestionTableViewCell.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import UIKit

protocol CommentConvertible {
    var title: String? { get }
    var imageUrl: String? { get }
    var creationDate: Date { get }
    var lastActivityDate: Date { get}
    var isAnswered: Bool { get }
    var acceptionTitle: String { get }
}

final class QuestionTableViewCell: UITableViewCell {
    
    static let identifier: String = "QuestionTableViewCell"

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var acceptedLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBOutlet weak var editedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        questionLabel.text = nil
        acceptedLabel.text = nil
        createdLabel.text = nil
        editedLabel.text = nil
    }

    func update(_ comment: CommentConvertible?) {
        guard let comment = comment else {
            return
        }
        questionLabel.text = comment.title
        profileImageView.setImageUrl(comment.imageUrl)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        acceptedLabel.text = comment.isAnswered ? comment.acceptionTitle : "-"
        createdLabel.text = "Created: \(dateFormatter.string(from: comment.creationDate))"
        editedLabel.text = "Last edited: \(dateFormatter.string(from: comment.lastActivityDate))"
        
    }
    
}
