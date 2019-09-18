//
//  AnswersViewController.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import UIKit

final class AnswersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: AnswersViewPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        presenter?.prepareForUse()
    }

}

extension AnswersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        cell.update(presenter?.answers[indexPath.row])
        return cell
    }
    

}

extension AnswersViewController: AnswersView {
    
    func update() {
        title = presenter?.question.title
        tableView.reloadData()
    }
}

private extension AnswersViewController {
    
    func initUI() {
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: QuestionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: QuestionTableViewCell.identifier)
    }
}
