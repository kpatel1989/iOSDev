//
//  ViewController.swift
//  KartikLabTest1
//
//  Created by macadmin on 2016-11-16.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var page2: KartikPage2!
    fileprivate var page3: KartikPage3!
    fileprivate var currentPage: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kartikCreateOtherControllers()
        kartikSwitchViewController(from: nil, to: page2)
    }

    func kartikCreateOtherControllers() {
        if (page2 == nil) {
            page2 = storyboard!.instantiateViewController(withIdentifier: "Page2") as! KartikPage2
        }
        if (page3 == nil) {
            page3 = storyboard!.instantiateViewController(withIdentifier: "Page3") as! KartikPage3
        }
    }

    func kartikDisposeOtherController() {
        if (page2 != nil && page2.view.superview == nil) {
            page2 = nil
        }
        if (page3 != nil && page3.view.superview == nil) {
            page3 = nil
        }
    }
    
    func kartikSwitchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        if (fromVC != nil) {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if (toVC != nil) {
            toVC!.view.frame = self.view.frame
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view,at:0)
            toVC!.didMove(toParentViewController: self)
        }
        currentPage = toVC
    }
    
    @IBAction func kartikToolbarSwitchBtnClickAction(_ sender: AnyObject) {
        kartikCreateOtherControllers()
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight,for: view, cache: true)
        if (currentPage == page2) {
            kartikSwitchViewController(from: page2, to: page3)
        } else if (currentPage == page3) {
            kartikSwitchViewController(from: page3, to: page2)
        }
        UIView.commitAnimations()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        kartikDisposeOtherController()
        
    }
}

