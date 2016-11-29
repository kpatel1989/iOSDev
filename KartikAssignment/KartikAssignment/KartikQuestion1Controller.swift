//
//  KartikQuestion1Controller.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion1Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionsTable: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    let cellIdentifier = "KartikQuestion1Cell"
    var question:Source!
    var tableViewCells:[KartikQuestion1TableViewCell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "KartikQuestion1TableViewCell", bundle: nil)
        optionsTable.register(nib, forCellReuseIdentifier: cellIdentifier)
        optionsTable.rowHeight = UITableViewAutomaticDimension
        optionsTable.estimatedRowHeight = 50
        
        let list = QuestionBank.QuestionList
        question = list.getNextQuestion(index:0)!
        questionLabel.text = "1. " + question.question
        
        tableViewCells = [KartikQuestion1TableViewCell]()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextBtnClickListener(_ sender: Any) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KartikQuestion1TableViewCell
        cell.switchListener = {
            currentSwitch in
            let state = currentSwitch.isOn
            if state {
                self.tableViewCells.forEach({ (viewCell:KartikQuestion1TableViewCell) in
                    viewCell.switchState = false
                })
            }
            currentSwitch.isOn = state
        }
        cell.option = question.options[indexPath.row]
        tableViewCells.append(cell)
        return cell
    }
}
