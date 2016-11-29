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
    var question:Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "KartikQuestion1TableViewCell", bundle: nil)
        optionsTable.register(nib, forCellReuseIdentifier: "KartikQuestion1Cell")
        question = QuestionBank.QuestionList.getNextQuestion()!
        questionLabel.text = question.question
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //QuestionBank.getNextQuestion() -> []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KartikQuestion1Cell", for: indexPath)
        
        cell.textLabel?.text = question.options[indexPath.row]
        return cell
    }
}
