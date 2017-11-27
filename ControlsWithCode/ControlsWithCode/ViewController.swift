//
//  ViewController.swift
//  ControlsWithCode
//
//  Created by macadmin on 2016-11-10.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
//        label.center = CGPoint(x: 150, y: 160)
        label.textAlignment = .center
        label.text = "Kartik Patel"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("Click Me", for: .normal)
//        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.addTarget(self, action: #selector(self.btnPressed), for: UIControlEvents.touchDown
         )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        
        let horizontalContraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let verticalContraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        let btnHorConst = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let btnVerConst = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -50)
        
        view.addConstraints([horizontalContraint,verticalContraint,btnHorConst,btnVerConst])
    }

    func btnPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert !", message: "You pressed the button", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

