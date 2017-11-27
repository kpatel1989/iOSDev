//
//  ViewController.swift
//  HRAppIOS
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var txtSalary: UITextField!
    
    @IBOutlet weak var txtBonus: UITextField!
    
    @IBOutlet weak var txtHours: UITextField!
    
    @IBOutlet weak var txtRate: UITextField!
    
    
    
    
    @IBOutlet weak var lblMess: UILabel!
    
    
    
    
    var arrEmployee: [Employee]=[Employee]()
    
    var currentEmployee : Employee? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnaddEmployee(_ sender: UIButton) {
        if (txtRate.text?.isEmpty)! && (txtHours.text?.isEmpty)! {
            let ft = FullTime()
            ft.setName(pName: txtName.text!)
            ft.setAge(pAge: Int(txtAge.text!)!)
            ft.salary = Int(txtSalary.text!)!
            ft.bonus = Int(txtBonus.text!)!
            
            
            arrEmployee.append(ft)
            currentEmployee = ft
            
            
            
            
        }
        lblMess.text = "Employee added"
    }

}

