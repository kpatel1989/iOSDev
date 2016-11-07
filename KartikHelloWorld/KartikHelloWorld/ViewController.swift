//
//  ViewController.swift
//  KartikHelloWorld
//
//  Created by macadmin on 2016-11-04.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textName: UITextField!
    
    @IBAction func saveBtnClick(_ sender: UIButton) {
        resultLabel.text = "Hello " + textName.text!;
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

