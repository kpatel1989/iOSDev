//
//  KartikFontInfoController.swift
//  Fonts
//
//  Created by macadmin on 2016-11-22.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class KartikFontInfoController: UIViewController {

    var font: UIFont!
    var isFavourite:Bool!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var favouritesSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.font = font
        textLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
        slider.value = Float(font.pointSize)
        sliderValue.text = "\(Int(font.pointSize))"
        favouritesSwitch.isOn = isFavourite
        
    }
    @IBAction func favouritesAction(_ sender: UISwitch) {
        let favoritesList = FavoritesList.sharedFavoritesList
        if sender.isOn {
            favoritesList.addFavorite(font.fontName)
        } else {
            favoritesList.removeFavorite(font.fontName)
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        textLabel.font = textLabel.font.withSize(CGFloat(slider.value))
        sliderValue.text = "\(lroundf(slider.value))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
