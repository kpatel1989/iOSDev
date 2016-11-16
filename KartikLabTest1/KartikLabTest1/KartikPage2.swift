//
//  KartikPage2.swift
//  KartikLabTest1
//
//  Created by macadmin on 2016-11-16.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikPage2: UIViewController {

    @IBOutlet weak var kartikNameField: UITextField!
    @IBOutlet weak var kartikNumberField: UITextField!
    @IBOutlet weak var kartikLeftSwitch: UISwitch!
    @IBOutlet weak var kartikRightSwitch: UISwitch!
    @IBOutlet weak var kartikButton: UIButton!
    @IBOutlet weak var kartikSliderValue: UILabel!
    @IBOutlet weak var kartikSegment: UISegmentedControl!
    @IBOutlet weak var kartikSliderControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kartikSliderValue.text = "\(lroundf(kartikSliderControl.value))"
        kartikSegment.sendActions(for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func kartikSegmentChangeAction(_ sender: AnyObject) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            kartikLeftSwitch.isHidden = true
            kartikRightSwitch.isHidden = true
            
            kartikButton.isHidden = false
            
            kartikSliderControl.isHidden = true
            kartikSliderValue.isHidden = true
            break
        case 1:
            kartikLeftSwitch.isHidden = false
            kartikRightSwitch.isHidden = false
            
            kartikButton.isHidden = true
            
            kartikSliderControl.isHidden = true
            kartikSliderValue.isHidden = true
            break
        case 2:
            kartikLeftSwitch.isHidden = true
            kartikRightSwitch.isHidden = true
            
            kartikButton.isHidden = true
            
            kartikSliderControl.isHidden = false
            kartikSliderValue.isHidden = false
            break
        default:
            break;
        }

    }
    
    @IBAction func kartikSliderValueChanged(_ sender: UISlider) {
        kartikSliderValue.text = "\(lroundf(sender.value))"
        kartikSliderValue.text = "\(lroundf(sender.value))"

    }

    @IBAction func kartikLeftSwitch(_ sender: UISwitch) {
        if (sender == kartikLeftSwitch) {
            kartikRightSwitch.setOn(sender.isOn, animated: true)
        } else {
            kartikLeftSwitch.setOn(sender.isOn, animated: true)
        }
    }

    @IBAction func kartikBtnClick(_ sender: UIButton) {
        var msg = ""
        msg += "Name: " + kartikNameField.text! + "\n"
        msg += "Number: " + kartikNumberField.text! + "\n"
        msg += "Slider: \(kartikSliderControl.value)\n"
        msg += "Switch: \(kartikLeftSwitch.isOn ? "On" : "Off")"
        
        let controller = UIAlertController(title: "Status",
                                           message:msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                     style: .default, handler: nil)
        
        controller.addAction(action)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
    }
}
