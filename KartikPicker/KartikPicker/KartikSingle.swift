//
//  KartikSingle.swift
//  KartikPicker
//
//  Created by macadmin on 2016-11-14.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikSingle: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var kartikPicker: UIPickerView!
    fileprivate let characterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo",
        "Threepio", "Lando"]

    @IBOutlet weak var resultlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func btnPressed(_ sender: AnyObject) {
//        let index = kartikPicker.selectedRow(inComponent: 0)
//        resultlabel.text = characterNames[index]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
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
