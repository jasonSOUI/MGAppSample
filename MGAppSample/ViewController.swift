//
//  ViewController.swift
//  MGAppSample
//
//  Created by 黃俊傑 on 2018/7/25.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sideMenu = storyboard!.instantiateViewController(withIdentifier: "sideMenu") as? UISideMenuNavigationController
        
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        
         self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.67, green: 0.2, blue: 0.1, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]

         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

