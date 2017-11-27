//
//  Intern.swift
//  HRAppIOS
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import Foundation
class Intern : Employee {
    var schoolName : String
    
    
    override init() {
        schoolName = ""
        super.init()
    }
    
    deinit {
        print("I am in the Intern's destructor")
    }
    
    override func displayData() {
        super.displayData()
        print("School: \(self.schoolName)")
        
    }
    
    
    
}


