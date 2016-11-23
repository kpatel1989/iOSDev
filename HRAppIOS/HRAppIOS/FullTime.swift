//
//  FullTime.swift
//  HRAppIOS
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import Foundation
class FullTime : Employee {
    var salary : Int
    var bonus : Int
    
    override init() {
        salary = 0
        bonus = 0
        super.init()
    }
    
    deinit {
        print("I am in the Fulltime's destructor")
    }
    
    
    override func calcEarnings() -> Int {
        return (salary + bonus)
    }
    
    override func displayData() {
        super.displayData()
        print("Salary: \(self.salary)")
        print("bonus: \(self.bonus)")
        
        
    }
    
    
    
    
}

