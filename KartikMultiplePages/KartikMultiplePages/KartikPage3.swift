//
//  KartikPage3.swift
//  KartikMultiplePages
//
//  Created by macadmin on 2016-11-09.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikPage3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func goToPage1BtnClick(_ sender: UIButton) {
        let homeCtrl = storyboard!.instantiateViewController(withIdentifier: "homePage") as! ViewController
        homeCtrl.switchViewController(from: self, to: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
