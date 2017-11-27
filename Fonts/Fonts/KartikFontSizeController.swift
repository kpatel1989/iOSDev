//
//  KartikFontSizeController.swift
//  Fonts
//
//  Created by macadmin on 2016-11-22.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikFontSizeController: UITableViewController {
    var font: UIFont!
    fileprivate static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    fileprivate static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = KartikFontSizeController.pointSizes[0]
    }
    
    func fontForDisplay(atIndexPath indexPath: IndexPath) -> UIFont {
        let pointSize = KartikFontSizeController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return KartikFontSizeController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: KartikFontSizeController.cellIdentifier,
            for: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(KartikFontSizeController.pointSizes[indexPath.row]) point"
        
        return cell
    }
}
