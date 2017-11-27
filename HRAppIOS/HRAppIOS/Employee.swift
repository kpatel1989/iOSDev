//
//  Employee.swift
//  HRAppIOS
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import Foundation
public class Employee : IDisplayable {
    private var name : String
    private var age : Int
    
    // accessor methods
    func getName() -> String {
        return self.name
    }
    
    func setName( pName : String) {
        self.name = pName
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func setAge( pAge : Int) {
        if (pAge > 0) {
            self.age = pAge
        } else {
            self.age = 0
        }
        
    }
    
    init() {
        name = ""
        age = 0
    }
    
    deinit {
        print("Empoyee's destructor");
    }
    
    func calcBirthYear() -> Int {
        return (2016 - self.age)
    }
    
    func calcEarnings() -> Int {
        return 1000
    }
    
    func displayData() {
        print ("Name: \(self.name)")
        print ("Age: " + String(self.age))
    }
}

