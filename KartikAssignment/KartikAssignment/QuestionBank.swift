//
//  QuestionBank.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-25.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import Foundation

struct Source {
    let question:String
    let options:[String]
    private let answer:String
    
    init(question:String,options:[String],answer:String) {
        self.question = question
        self.options = options
        self.answer = answer
    }
}

class QuestionBank {
    public static let QuestionList = QuestionBank()
    
    var TOTAL_QUESTIONS:Int
    var randomQuestions: [Int32]!
    var questionBank:[Source]!
    var currentQuestion:Int
    
    private init() {
        TOTAL_QUESTIONS = 5
        currentQuestion = 0
        buildQuestionBank()
        generateRandomQuestions()
    }
    
    func buildQuestionBank() {
        let resource = Bundle.main.url(forResource: "questions", withExtension: "plist")
        let dict = NSArray(contentsOf: resource!) as! [[String:Any]]
        questionBank = [Source]()
        for index in 0..<dict.count {
            let quest = dict[index]
            questionBank.append(Source(question: quest["question"] as! String, options: quest["options"] as! [String], answer: quest["answer"] as! String))
        }
    }
    
    func generateRandomQuestions() {
        randomQuestions = [Int32]()
        for _ in 0..<TOTAL_QUESTIONS {
            let index = arc4random_uniform(UInt32(questionBank.count))
            if !randomQuestions.contains(Int32(index)) {
                randomQuestions.append(Int32(index))
            }
        }
    }
    
    func getNextQuestion(index:Int) -> Source? {
        var ques:Source? = nil
        if (index >= 0 && index < TOTAL_QUESTIONS) {
            ques = questionBank[Int(randomQuestions[index])]
        }
        return ques
    }
}
