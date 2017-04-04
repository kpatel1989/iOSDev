//
//  ViewController.swift
//  GoogleSearchWithGCD
//
//  Created by Kartik Patel on 2017-04-04.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func textEditChange(_ sender: UITextField) {
        print(sender.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

