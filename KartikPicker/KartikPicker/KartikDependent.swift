//
//  KartikDependent.swift
//  KartikPicker
//
//  Created by macadmin on 2016-11-15.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikDependent: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var dependentPicker: UIPickerView!
    let hour = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    let time = ["AM","PM"]
    var stateZips:[String:[String]] = [:]
    var states : [String]!
    var zips:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let plistUrl = bundle.url(forResource: "statedictionary", withExtension: "plist")
        stateZips = NSDictionary(contentsOf: plistUrl!) as! [String: [String]]
        states = stateZips.keys.sorted()
        zips = (stateZips[states[0]])!.sorted()
    }

    @IBAction func btnPressed(_ sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? states.count : zips.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? states[row] : zips[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(1)
            dependentPicker.selectRow(0, inComponent: 1,
                                      animated: true)
        }
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
