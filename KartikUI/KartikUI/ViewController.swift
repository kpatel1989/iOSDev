//
//  ViewController.swift
//  KartikUI
//
//  Created by macadmin on 2016-11-07.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func btnClickAction(_ sender: UIButton) {
        outputLabel.text = "Welcome " + inputText.text!
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

