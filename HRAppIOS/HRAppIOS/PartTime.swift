//
//  PartTime.swift
//  HRAppIOS
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import Foundation
class PartTime : Employee {
    var hoursWorked : Int
    var rate : Int
    
    override init() {
        hoursWorked = 0
        rate = 0
        super.init()
    }
    
    deinit {
        print("I am in the PartTime's destructor")
    }
    
    
    override func calcEarnings() -> Int {
        return (hoursWorked * rate)
    }
    
    override func displayData() {
        super.displayData()
        print("Rate: \(self.rate)")
        print("Hours: \(self.hoursWorked)")
        
        
    }
    
}

