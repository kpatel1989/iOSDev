//
//  KartikTableView.swift
//  Fonts
//
//  Created by macadmin on 2016-11-23.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikTableView: UIViewController,UITableViewDataSource {
    let kartikCellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var kartikTableView:UITableView!
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver","Year":"1234"],
        ["Name" : "MacBook Pro", "Color" : "Silver","Year":"1234"],
        ["Name" : "iMac", "Color" : "Silver","Year":"1234"],
        ["Name" : "Mac Mini", "Color" : "Silver","Year":"1234"],
        ["Name" : "Mac Pro", "Color" : "Black","Year":"1234"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "NameAndColorCell", bundle: nil)
        kartikTableView.register(nib,
                           forCellReuseIdentifier: kartikCellTableIdentifier)
        kartikTableView.rowHeight = 130
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = kartikTableView.dequeueReusableCell(
                withIdentifier: kartikCellTableIdentifier, for: indexPath)
                as! NameAndColorCell
            
            let rowData = computers[(indexPath as NSIndexPath).row]
            cell.name = rowData["Name"]!
            cell.color = rowData["Color"]!
            cell.year = rowData["Year"]!
            return cell
    }


}
