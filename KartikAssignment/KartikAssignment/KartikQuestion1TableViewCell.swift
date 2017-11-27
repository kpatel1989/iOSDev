//
//  KartikQuestion1TableViewCell.swift
//  KartikAssignment
//
//  Created by macadmin on 2016-11-24.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikQuestion1TableViewCell: UITableViewCell {

    var option:String = "" {
        didSet {
            optionLabel.text = option
        }
    }
    var switchState:Bool = false {
        didSet {
            optionSwitch.isOn = switchState
        }
    }
    var switchListener:((UISwitch) -> Void)? = nil

    @IBOutlet private weak var optionLabel: UILabel!
    @IBOutlet private weak var optionSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        optionSwitch.isOn = false
    }
    @IBAction func switchEventChange(_ sender: UISwitch) {
        if let switchListener = self.switchListener {
            switchListener(sender)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
