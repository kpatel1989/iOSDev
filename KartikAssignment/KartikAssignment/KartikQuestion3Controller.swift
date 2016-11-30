//
//  KartikQuestion3Controller.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion3Controller: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    var question:Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = QuestionBank.QuestionList
        question = list.getNextQuestion(index: 1)!
        questionLabel.text = "3. " + question.question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return question.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping;
        label.numberOfLines = 0;
        label.text = question.options[row]
        label.sizeToFit()
        return label;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "question4"))! as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
