//
//  KartikQuestion2TableViewCell.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion2TableViewCell: UITableViewCell {

    var option:String = "" {
        didSet {
            optionButton.setTitle(option, for: UIControlState.normal)
        }
    }
    
    var clickListener:((UIButton) -> Void)? = nil

    @IBOutlet weak var optionButton: UIButton!
    
    @IBAction func btnClick(_ sender: UIButton) {
        if let listener = self.clickListener {
            listener(sender)
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
