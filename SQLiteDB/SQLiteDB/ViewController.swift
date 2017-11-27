//
//  ViewController.swift
//  SQLiteDB
//
//  Created by Kartik Patel on 2017-04-04.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    var databasePath:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let dirPaths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("contacts.db").path
        if (fileManager.fileExists(atPath: databasePath)) {
            let contactDb = FMDatabase(path: databasePath)
            if contactDb == nil {
                print("Database Error \(contactDb?.lastErrorMessage())")
            }
            
            //Contacts DB exists
            if (contactDb?.open())!  {
                let createTable = "CREATE TABLE IF NOT EXISTS contacts("
                    + "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                    + "NAME TEXT,"
                    + "ADDRESS TEXT, "
                    + "PHONE TEXT)"
                if !(contactDb?.executeStatements(createTable))! {
                    print ("Create Table Error \(contactDb?.lastErrorMessage()!)")
                } else {
                    print("Table Created .")
                }
            } else {
                print ("Database Open Error \(contactDb?.lastErrorMessage())")
            }
            contactDb?.close();
        } else {
            print("Error opening file");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    @IBAction func save(_ sender: UIButton) {
        let contactDb = FMDatabase(path: databasePath)
        if (contactDb?.open())! {
            let insertQuery = "INSERT INTO contacts (name, address, phone) "
                + "VALUES('\(name.text!)','\(address.text!)','\(phone.text)')"
            let result = contactDb?.executeUpdate(insertQuery, withArgumentsIn: nil)
            if !result! {
                print("Insert Error \(contactDb?.lastErrorMessage())")
                status.text = "Failed to add contact."
            } else {
                status.text = "Contact Saved."
                name.text = ""
                address.text = ""
                phone.text = ""
            }
        } else {
            print ("Database Open Error \(contactDb?.lastErrorMessage())")
        }
    }
    
    @IBAction func find(_ sender: UIButton) {
        let contactDb = FMDatabase(path: databasePath)
        if (contactDb?.open())! {
            let findContactQuery = "SELECT name, address, phone FROM contacts where name = '\(name.text)'"
            let result = contactDb?.executeQuery(findContactQuery, withArgumentsIn: nil)
            if (result?.next())! {
                address.text = result?.string(forColumn: "name")
                phone.text = result?.string(forColumn: "phone")
                status.text = "Record has been found."
            } else {
                status.text = "Record does not exist."
            }
        } else {
            print ("Database Open Error \(contactDb?.lastErrorMessage())")
        }
    }
}

