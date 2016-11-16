//
//  ViewController.swift
//  IosMenu
//
//  Created by macadmin on 2016-11-16.
//  Copyright © 2016 LambtonCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pagectrls: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addPage(_ sender: AnyObject) {
        let pageController = UIViewController()
        let page = UIView(frame: view.frame)
        page.backgroundColor = UIColor.blue
        pageController.view = page
        pagectrls.append(pageController)
        showPage(pageController)
    }
    
    func showPage(_ page: UIViewController) {
        page.willMove(toParentViewController: self)
        self.view.addSubview(page.view)
        self.addChildViewController(page)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

