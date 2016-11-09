//
//  ViewController.swift
//  KartikOrientation
//
//  Created by macadmin on 2016-11-08.
//  Copyright © 2016 lambton college. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            let orient = UIApplication.shared.statusBarOrientation
            
            switch orient {
            case .portrait:
                print("Portrait")
                self.applyportraitConstraint()
                break
            // Do something
            default:
                print("LandScape")
                // Do something else
                self.applyLandScapeConstraint()
                break
            }
            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
                print("rotation completed")
        })
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    func applyportraitConstraint() {
//        self.view.addConstraint()
//        self.view.addConstraint(self.RedView_VerticalSpace_To_BlueView)
//        self.view.addConstraint(self.RedView_LeadingSpace_To_SuperView)
//        self.view.addConstraint(self.BlueView_TrailingSpace_To_SuperView)
        
//        self.view.removeConstraint(self.RedViewWidth)
//        self.view.removeConstraint(self.RedView_HorizontalSpace_To_BlueView)
//        self.view.removeConstraint(self.RedView_BottomSpace_To_SuperView)
//        self.view.removeConstraint(self.BlueView_TopSpace_To_SuperView)
    }
    
    func applyLandScapeConstraint() {
        
    }
}

