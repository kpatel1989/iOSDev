//
//  ViewController.swift
//  KartikControlFunWithCode
//
//  Created by macadmin on 2016-11-11.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var nameTextBox: UITextField!
    var numberLabel: UILabel!
    var numberTextBox: UITextField!
    var sliderLabel: UILabel!
    var sliderTextBox: UITextField!
    var segment: UILabel!
    var leftSwitch: UITextField!
    var rightSwitch: UITextField!
    var button: UITextField!
    
    let controlsGapLeft:Int = 30
    let controlsGapTop:Int = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
        addImageView()
        addName()
        addNumber()
        addSlider()
        addSegment()
        addSwitches()
        addButton()
    }
    
    func addName() {
        nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.textColor = UIColor.black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        let leftConstr = NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: CGFloat(controlsGapLeft))
        let topConstr = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: CGFloat(controlsGapTop))
        let widthConstr = NSLayoutConstraint(item: nameLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 80)
        view.addConstraints([leftConstr,topConstr,widthConstr])
        
        nameTextBox = UITextField()
        nameTextBox.placeholder = "Enter your name"
        nameTextBox.borderStyle = .roundedRect
        nameTextBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextBox)
        let textFieldLeftConstr = NSLayoutConstraint(item: nameTextBox, attribute: .left, relatedBy: .equal, toItem: nameLabel, attribute: .right, multiplier: 1, constant: CGFloat(controlsGapLeft))
        let textFieldTopConstr = NSLayoutConstraint(item: nameTextBox, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .top, multiplier: 1, constant: 0)
        let textRightConstr = NSLayoutConstraint(item: nameTextBox, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -CGFloat(controlsGapLeft))
        
        view.addConstraints([textFieldLeftConstr,textFieldTopConstr,textRightConstr])
    }
    
    func addNumber() {
        numberLabel = UILabel()
        numberLabel.text = "Number:"
        numberLabel.textColor = UIColor.black
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numberLabel)
        let leftConstr = NSLayoutConstraint(item: numberLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: CGFloat(controlsGapLeft))
        let topConstr = NSLayoutConstraint(item: numberLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: CGFloat(controlsGapTop))
        let widthConstr = NSLayoutConstraint(item: numberLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 80)
        view.addConstraints([leftConstr,topConstr,widthConstr])
        
        numberTextBox = UITextField()
        numberTextBox.placeholder = "Enter a number"
        numberTextBox.borderStyle = .roundedRect
        numberTextBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numberTextBox)
        let textFieldLeftConstr = NSLayoutConstraint(item: numberTextBox, attribute: .left, relatedBy: .equal, toItem: numberLabel, attribute: .right, multiplier: 1, constant: CGFloat(controlsGapLeft))
        let textFieldTopConstr = NSLayoutConstraint(item: numberTextBox, attribute: .top, relatedBy: .equal, toItem: numberLabel, attribute: .top, multiplier: 1, constant: 0)
        let textRightConstr = NSLayoutConstraint(item: numberTextBox, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -CGFloat(controlsGapLeft))
        
        view.addConstraints([textFieldLeftConstr,textFieldTopConstr,textRightConstr])
    }
    
    func addSlider() {
        
    }
    
    func addSegment() {
        
    }
    
    func addSwitches() {
        
    }
    
    func addButton() {
        
    }
    
    func addImageView() {
        imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "apress_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let verticalConstr = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let widthConstr = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 200)
        let topConstr = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 50)
        
        view.addConstraints([verticalConstr,widthConstr,topConstr])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

