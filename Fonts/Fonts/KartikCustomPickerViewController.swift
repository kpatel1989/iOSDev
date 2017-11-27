//
//  KartikCustomPickerViewController.swift
//  Pickers
//
//  Created by Kim Topley on 9/7/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import UIKit
import AudioToolbox

class KartikCustomPickerViewController: UIViewController,
                UIPickerViewDelegate, UIPickerViewDataSource {
    fileprivate var kartikImages:[UIImage]!
    @IBOutlet weak var kartikPicker: UIPickerView!
    @IBOutlet weak var kartikWinLabel: UILabel!
    @IBOutlet weak var kartikButton: UIButton!
    fileprivate var kartikWinSoundID: SystemSoundID = 0
    fileprivate var kartikCrunchSoundID: SystemSoundID = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        kartikImages = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        kartikWinLabel.text = " " // Note the space between the quotes
        arc4random_stir()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func spin(_ sender: AnyObject) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(kartikImages.count)))
            if newValue == lastVal {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            kartikPicker.selectRow(newValue, inComponent: i, animated: true)
            kartikPicker.reloadComponent(i)
            if numInRow >= 3 {
                win = true
            }
        }
        
        if kartikCrunchSoundID == 0 {
            let soundURL = Bundle.main.url(
                        forResource: "crunch", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &kartikCrunchSoundID)
        }
        AudioServicesPlaySystemSound(kartikCrunchSoundID)
        
        if win {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                self.playWinSound()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                self.showButton()
            }
        }
        kartikButton.isHidden = true
        kartikWinLabel.text = " " // Note the space between the quotes
    }
    
    func showButton() {
        kartikButton.isHidden = false
    }
    
    func playWinSound() {
        if kartikWinSoundID == 0 {
         let soundURL = Bundle.main.url(
                        forResource: "win", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &kartikWinSoundID)
        }
        AudioServicesPlaySystemSound(kartikWinSoundID)
        kartikWinLabel.text = "WINNER!"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            self.showButton()
        }
    }
   
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return kartikImages.count
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let image = kartikImages[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView,
            rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
