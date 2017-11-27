//
//  ViewController.swift
//  KartikTableView
//
//  Created by macadmin on 2016-11-17.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    let names = ["Kartik", "Demi", "Dhru", "Tirth"]
    let tableIndentifier = "table"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: tableIndentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: tableIndentifier)
        }
        cell?.imageView?.image = #imageLiteral(resourceName: "star")
        cell?.imageView?.highlightedImage = #imageLiteral(resourceName: "star2")
        cell?.textLabel?.text = names[indexPath.row]
        cell?.detailTextLabel?.text = "Student " + String(indexPath.row+1)
        cell?.indentationLevel = indexPath.row
        
        return cell!
    }
}

