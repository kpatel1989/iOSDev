//
//  KartikCustom.swift
//  KartikPicker
//
//  Created by macadmin on 2016-11-15.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit
import AudioToolbox

class KartikCustom: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var customPicker: UIPickerView!
    
    var winSound: SystemSoundID = 0
    var crunchsound: SystemSoundID = 0
    var images: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [
            #imageLiteral(resourceName: "seven"),
            #imageLiteral(resourceName: "bar"),
            #imageLiteral(resourceName: "crown"),
            #imageLiteral(resourceName: "cherry"),
            #imageLiteral(resourceName: "lemon"),
            #imageLiteral(resourceName: "apple")
        ]
        customPicker.isUserInteractionEnabled = false
    }

    @IBAction func btnPressed(_ sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UIImageView(image: images[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
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
