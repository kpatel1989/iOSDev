//
//  ViewController.swift
//  myTableView
//
//  Created by macadmin on 2016-11-15.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTelanganaTable: UITableView!
    let arrData = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7"]
    let arrData2 = [ "Item_A", "Item_B", "Item_C"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTelanganaTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // print ("section: \(indexpath.section) and row: \(indexpath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cel", for: indexPath)
        
        if indexPath.section == 0{
            cell.textLabel?.text = arrData[indexPath.row]
        }else{
            cell.textLabel?.text = arrData2[indexPath.row]
        
        }
                return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
      return arrData.count
        }else if section == 1 {
            return arrData2.count
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Lambton"
        }else {
            return "Cestar"
        }
        tableView(<#T##tableView: UITableView##UITableView#>, didSelectRowAt: <#T##IndexPath#>)
        print ("selection: \(indexpath.section), row: \(indexpath.row)")
        if (indexpath.section == 0) {
            print (arrData[indexpath.row])
        }else {
            print (arrData2[indexpath.row])
        }
    }
}

