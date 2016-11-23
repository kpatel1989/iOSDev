//
//  ViewController.swift
//  TableView2
//
//  Created by macadmin on 2016-11-18.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    let names = [["name" : "Kartik", "color" : "Green"],
                 ["name" : "asda sd", "color" : "Red"],
                 ["name" : "adsa d", "color" : "Blue"]]
    
    let tableIndentifier = "table"

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: tableIndentifier)
        table.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIndentifier) as! TableViewCell
        cell.name = names[indexPath.row]["name"]!
        cell.color = names[indexPath.row]["color"]!
        return cell

    }

}

