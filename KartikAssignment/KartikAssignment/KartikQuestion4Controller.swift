//
//  KartikQuestion4Controller.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion4Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var questionLabel: UILabel!
    var question:Source!
    let cellIdentifier = "KartikQuestion4Cell"
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = QuestionBank.QuestionList
        question = list.getNextQuestion(index: 1)!
        questionLabel.text = "4. " + question.question
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 40
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = question.options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "question5"))! as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
