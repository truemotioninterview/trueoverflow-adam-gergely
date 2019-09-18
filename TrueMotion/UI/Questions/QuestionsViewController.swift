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
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: QuestionViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        presenter?.prepareForUse()
    }
}

extension QuestionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        cell.update(presenter?.questions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.selectQuestion(at: indexPath.row)
    }
}

extension QuestionsViewController: QuestionsView {
    
    func showUnansweredQuestionsNumber(_ number: Int) {
        unAnsweredJsQuestionsNumberLabel.text = "\(number)"
    }
    
    func updateQuestions() {
        tableView.reloadData()
    }
    
    func showAnswers(for question: Question) {
        let answersVc = AnswersViewController()
        answersVc.presenter = AnswersPresenter(view: answersVc, question: question)
        navigationController?.pushViewController(answersVc, animated: true)
    }
}

private extension QuestionsViewController {
    
    func initUI() {
        title = "Open questions for JS"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: QuestionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: QuestionTableViewCell.identifier)
    }
}
