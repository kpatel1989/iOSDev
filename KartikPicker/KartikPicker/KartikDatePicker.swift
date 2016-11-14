//
//  KartikDatePicker.swift
//  KartikPicker
//
//  Created by macadmin on 2016-11-14.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikDatePicker: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        dateLabel.text = datePicker.date.description
    }
    
    @IBAction func selectBtnClick(_ sender: AnyObject) {
        let date = Date()
        
        datePicker.setDate(date, animated: true)
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
