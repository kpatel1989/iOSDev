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
    var options:[UIImage] = []
    let cellIdentifier = "KartikQuestion5Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question = Source(question: "Where is the cycle?",
                          options: [], answer: "")
        options =
            [#imageLiteral(resourceName: "motorcycle"),
             #imageLiteral(resourceName: "cycle"),
             #imageLiteral(resourceName: "truck"),
             #imageLiteral(resourceName: "jeep")]
        questionLabel.text = "5. " + question.question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        let image = options[indexPath.row]
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        cell.addSubview(imageView)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertCtrl = UIAlertController(title: "Result", message: "Total Score", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Ok", style: .cancel, handler: {
            action in
            let navgCtrl = self.storyboard?.instantiateInitialViewController()
            self.present(navgCtrl!, animated: true, completion: nil)
        })
        alertCtrl.addAction(playAgain)
        present(alertCtrl, animated: true, completion: nil)
    }
}
