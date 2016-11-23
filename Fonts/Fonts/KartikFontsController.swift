//
//  KartikFontsController.swift
//  Fonts
//
//  Created by macadmin on 2016-11-22.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikFontsController: UITableViewController {

    var kartikFontFamily:[String]!
    var kartikCellPointSize:CGFloat!
    var kartikFavourites:FavoritesList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kartikFontFamily = (UIFont.familyNames as [String]).sorted()
        let preferedFontStyle = UIFont.preferredFont(forTextStyle: .headline)
        kartikCellPointSize = preferedFontStyle.pointSize
        kartikFavourites = FavoritesList.sharedFavoritesList
        tableView.estimatedRowHeight = kartikCellPointSize
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return kartikFavourites.favorites.count >= 1 ? 2 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? kartikFontFamily.count : 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "Favourite Fonts"
    }
    
    func fontForDisplay(_ indexPath: IndexPath) -> UIFont? {
        if (indexPath.section == 0) {
            let familyName = UIFont.fontNames(forFamilyName: self.kartikFontFamily[indexPath.row]).first
            return familyName != nil ? UIFont(name: familyName!, size:kartikCellPointSize) : nil
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "familyName", for: indexPath)
            cell.textLabel?.text = kartikFontFamily[indexPath.row]
            cell.textLabel?.font = fontForDisplay(indexPath)
            cell.detailTextLabel?.text = kartikFontFamily[indexPath.row]
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "favourites", for: indexPath)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let fontListController = segue.destination as! KartikFontListController
        if (indexPath.section == 0) {
            let fontNames = UIFont.fontNames(forFamilyName: kartikFontFamily[indexPath.row]).sorted()
            fontListController.fontNames = fontNames
            fontListController.navigationItem.title = kartikFontFamily[indexPath.row]
            fontListController.showFavourites = false
        } else {
            fontListController.showFavourites = true
            fontListController.fontNames = kartikFavourites.favorites
            fontListController.navigationItem.title = "Navigation"
        }
    }
}
