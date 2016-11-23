//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by Kim Topley on 9/12/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    var name: String = "" {
        didSet {
            if (name != oldValue) {
                kartikNameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if (color != oldValue) {
                kartikColorLabel.text = color
            }
        }
    }
    var year: String = "" {
        didSet {
            if (year != oldValue) {
                kartikYearLabel.text = color
            }
        }
    }
    
    @IBOutlet var kartikNameLabel: UILabel!
    @IBOutlet var kartikColorLabel: UILabel!
    @IBOutlet var kartikYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
