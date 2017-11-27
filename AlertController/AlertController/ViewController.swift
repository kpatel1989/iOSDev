//
//  ViewController.swift
//  AlertController
//
//  Created by macadmin on 2016-11-08.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func alertControllerAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert Box", message: "Hey there! You have successfully opened a alert box", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController,animated: true);
        
    }
    func openAlertBox() {
        let alertController = UIAlertController(title: "Alert Box", message: "Hey there! You have successfully opened a alert box", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController,animated: true);
    }
    
    @IBAction func popOverAlertContollerAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Action Sheet", message: "Hey there! You have successfully opened a action sheet", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "Open an Alert box", style: .default, handler: {
            action in
            self.openAlertBox()
        })
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        
        self.present(alertController,animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

