//
//  KartikQuestion2Controller.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion2Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionsTable: UITableView!
    var question:Source!
    var tableViewCells:[KartikQuestion2TableViewCell]!
    let cellIdentifier = "KartikQuestion2Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "KartikQuestion2TableViewCell", bundle: nil)
        optionsTable.register(nib, forCellReuseIdentifier: cellIdentifier)
        optionsTable.rowHeight = UITableViewAutomaticDimension
        optionsTable.estimatedRowHeight = 50
        
        let list = QuestionBank.QuestionList
        question = list.getNextQuestion(index: 1)!
        questionLabel.text = "2. " + question.question
        
        tableViewCells = [KartikQuestion2TableViewCell]()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KartikQuestion2TableViewCell
        cell.clickListener = {
                button in
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "question3"))! as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.option = question.options[indexPath.row]
        tableViewCells.append(cell)
        return cell
    }
}
