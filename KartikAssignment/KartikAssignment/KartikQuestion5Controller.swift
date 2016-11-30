//
//  KartikQuestion5Controller.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion5Controller: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    var question:Source!
    let cellIdentifier = "KartikQuestion5Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = QuestionBank.QuestionList
        question = list.getNextQuestion(index: 1)!
        questionLabel.text = "5. " + question.question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return question.options.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping;
        label.numberOfLines = 0;
        label.text = question.options[indexPath.row]
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        cell.sizeToFit()
        cell.addSubview(label)
        
        return cell
    }
}
