//
//  KartikFontListController.swift
//  Fonts
//
//  Created by macadmin on 2016-11-22.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikFontListController: UITableViewController {

    var fontNames:[String]!
    var showFavourites:Bool!
    var cellPointSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let preferredTableViewFont =
            UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
        if showFavourites! {
            navigationItem.rightBarButtonItem = editButtonItem
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }

    func fontForDisplay(_ indexPath: IndexPath) -> UIFont {
        return UIFont(name: fontNames[indexPath.row], size:cellPointSize)!
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontListCell", for: indexPath)
        cell.textLabel?.text = fontNames[indexPath.row]
        cell.textLabel?.font = fontForDisplay(indexPath)
        cell.detailTextLabel?.text = fontNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        return showFavourites
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        if !showFavourites {
            return
        }
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Delete the row from the data source
            let favorite = fontNames[indexPath.row]
            FavoritesList.sharedFavoritesList.removeFavorite(favorite)
            fontNames = FavoritesList.sharedFavoritesList.favorites
            
            tableView.deleteRows(at: [indexPath],
                                 with: UITableViewRowAnimation.fade)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        FavoritesList.sharedFavoritesList.moveItem(fromIndex: sourceIndexPath.row,
                                                   toIndex: destinationIndexPath.row)
        fontNames = FavoritesList.sharedFavoritesList.favorites
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        let font = fontForDisplay(indexPath!)
        if (segue.identifier == "fontInfo") {
            let fontInfo = segue.destination as! KartikFontInfoController
            fontInfo.font = font
            fontInfo.title = fontInfo.font.fontName
            fontInfo.isFavourite =
                FavoritesList.sharedFavoritesList.favorites.contains(font.fontName)

        } else {
            let sizesVC =  segue.destination as! KartikFontSizeController
            sizesVC.title = font.fontName
            sizesVC.font = font
        }
    }
}
