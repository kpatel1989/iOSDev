//
//  KartikDependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Kim Topley on 9/7/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import UIKit

class KartikDependentComponentPickerViewController: UIViewController,
                UIPickerViewDelegate, UIPickerViewDataSource {
    fileprivate let kartikStateComponent = 0
    fileprivate let kartikZipComponent = 1
    fileprivate var kartikStateZips:[String : [String]]!
    fileprivate var kartikStates:[String]!
    fileprivate var kartikZips:[String]!
    @IBOutlet weak var dependentPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bundle = Bundle.main
        let plistURL = bundle.url(forResource: "statedictionary",
                                             withExtension: "plist")
        kartikStateZips = NSDictionary(contentsOf: plistURL!)
                                 as! [String : [String]]
        let allStates = kartikStateZips.keys
        kartikStates = allStates.sorted()
        
        let selectedState = kartikStates[0]
        kartikZips = kartikStateZips[selectedState]
       
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

    @IBAction func onButtonPressed(_ sender: AnyObject) {
        let stateRow =
            dependentPicker.selectedRow(inComponent: kartikStateComponent)
        let zipRow =
            dependentPicker.selectedRow(inComponent: kartikZipComponent)
        
        let state = kartikStates[stateRow]
        let zip = kartikZips[zipRow]
        
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(
                        title: title,
                        message: message,
                        preferredStyle: .alert)
        let action = UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
            numberOfRowsInComponent component: Int) -> Int {
        if component == kartikStateComponent {
            return kartikStates.count
        } else {
            return kartikZips.count
        }
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if component == kartikStateComponent {
            return kartikStates[row]
        } else {
            return kartikZips[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        if component == kartikStateComponent {
            let selectedState = kartikStates[row]
            kartikZips = kartikStateZips[selectedState]
            dependentPicker.reloadComponent(kartikZipComponent)
            dependentPicker.selectRow(0, inComponent: kartikZipComponent,
            animated: true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == kartikZipComponent {
            return pickerWidth/3
        } else {
            return 2 * pickerWidth/3
        }
    }
}
