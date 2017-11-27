//
//  ViewController.swift
//  UIChapter4
//
//  Created by macadmin on 2016-11-07.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num1:Int=0
    var num2:Int=0
    var opr:AritOperator=AritOperator.ADD
    
    enum AritOperator :Int {
        case ADD=0,SUB,MULTI,DIVIDE,MOD,POWER,SQUARE
    }
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBOutlet weak var tryAgainBtn: UIButton!
    
    func createNewQuestion() {
        let num1 = Int(arc4random_uniform(100))+1
        let num2 = Int(arc4random_uniform(100))+1
        let opr = Int(arc4random_uniform(6)+1)
        let oprEnum = AritOperator(rawValue:opr)!
        self.num1 = num1
        self.num2 = num2
        self.opr = oprEnum
        
        switch oprEnum {
            case AritOperator.ADD:
                question.text = String(num1) + " + " + String(num2)
            break
            case AritOperator.SUB:
                question.text = String(num1) + " - " + String(num2)
            break
            case AritOperator.MULTI:
                question.text = String(num1) + " * " + String(num2)
            break
            case AritOperator.DIVIDE:
                question.text = String(num1) + " / " + String(num2)
            break
            case AritOperator.MOD:
                question.text = String(num1) + " % " + String(num2)
            break
            case AritOperator.POWER:
                question.text = String(num1) + " ^ " + String(num2)
            break
            case AritOperator.SQUARE:
                question.text = "sqr(" + String(num1) + ")"
            break
        }
        tryAgainBtn.isHidden = true;
    }
    func checkAnswer() -> Bool {
        switch self.opr {
        case AritOperator.ADD:
            return Double(answer.text!) == Double(self.num1 + self.num2)
        case AritOperator.SUB:
            return Double(answer.text!) == Double(self.num1 - self.num2)
        case AritOperator.MULTI:
            return Double(answer.text!) == Double(self.num1 * self.num2)
        case AritOperator.DIVIDE:
            return Double(answer.text!) == Double(self.num1 / self.num2)
        case AritOperator.MOD:
            return Double(answer.text!) == Double(self.num1 % self.num2)
        case AritOperator.POWER:
            return Double(answer.text!) == Double(self.num1 ^ self.num2)
        case AritOperator.SQUARE:
            return Double(answer.text!) == Double(self.num1 * self.num1)
        }
    }
    
    @IBAction func checkBtnClick(_ sender: UIButton) {
        if (checkAnswer()) {
            output.text = "The answer is correct!"
        } else {
            output.text = "Sorry! The answer is wrong"
        }
        tryAgainBtn.isHidden = false;
    }
    
    @IBAction func tryAgainClick(_ sender: AnyObject) {
        output.text = ""
        answer.text = ""
        createNewQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

