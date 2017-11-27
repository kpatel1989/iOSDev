//
//  KartikDouble.swift
//  KartikPicker
//
//  Created by macadmin on 2016-11-14.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikDouble: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    let breads = ["9 Grain", "Whole Wheat", "Italian"]
    let meat = ["Pepperoni", "Salami", "Turkey", "Ham", "Roast Beaf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? breads.count : meat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? breads[row] : meat[row]
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
