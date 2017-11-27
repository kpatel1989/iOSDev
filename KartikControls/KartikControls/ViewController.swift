//
//  ViewController.swift
//  KartikControls
//
//  Created by macadmin on 2016-11-07.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var sliderValue: UILabel!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var centerBtn: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            centerBtn.isHidden = true
            break
        case 1:
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            centerBtn.isHidden = false
            break
        default:
            break;
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValue.text = "\(lroundf(slider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue.text = "\(lroundf(slider.value))"
        segment.sendActions(for: UIControlEvents.valueChanged)
    }
    
    @IBAction func leftSwitch(_ sender: UISwitch) {
        if (sender == leftSwitch) {
            rightSwitch.setOn(sender.isOn, animated: true)
        } else {
            leftSwitch.setOn(sender.isOn, animated: true)
        }
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?",
                                           message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                                      style: .destructive, handler: { action in
                                        let msg = self.name.text!.isEmpty
                                            ? "You can breathe easy, everything went OK."
                                            : "You can breathe easy, \(self.name.text!),"
                                            + " everything went OK."
                                        let controller2 = UIAlertController(
                                            title:"Something Was Done",
                                            message: msg, preferredStyle: .alert)
                                        let cancelAction = UIAlertAction(title: "Phew!",
                                                                         style: .cancel, handler: nil)
                                        controller2.addAction(cancelAction)
                                        self.present(controller2, animated: true,
                                                     completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No way!",
                                     style: .cancel, handler: nil)
        
        let action = UIAlertAction(title: "New action!",
                                   style: .default, handler: nil)
        
        let action3 = UIAlertAction(title: "Action 3",
                                    style: .default, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        controller.addAction(action)
        controller.addAction(action3)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

