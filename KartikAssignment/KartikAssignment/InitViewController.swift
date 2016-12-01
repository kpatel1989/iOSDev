//
//  InitViewController.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-12-01.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionBank.QuestionList.generateRandomQuestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
