//
//  QuestionsViewController.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import UIKit

final class QuestionsViewController: UIViewController {

    @IBOutlet weak var unAnsweredJsQuestionsNumberLabel: UILabel!
    
    var presenter: QuestionViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.prepareForUse()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuestionsViewController: QuestionsView {
    
    func showUnansweredQuestionsNumber(_ number: Int) {
        unAnsweredJsQuestionsNumberLabel.text = "\(number)"
    }
}
