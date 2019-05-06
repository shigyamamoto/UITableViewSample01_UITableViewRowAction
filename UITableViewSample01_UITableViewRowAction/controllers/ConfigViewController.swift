//
//  ConfigViewController.swift
//  UITableViewSample01_UITableViewRowAction
//
//  Created by shigeki yamamoto on 2019/04/29.
//  Copyright © 2019 shigeki yamamoto. All rights reserved.
//

import UIKit

protocol ListMakeDelegate{
    func addListRandom(number: Int)
}

class ConfigViewController: UIViewController {

    @IBOutlet var listAddBtn: UIButton!
    
    var listMakeDelegate: ListMakeDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegate
        let nav : UINavigationController = tabBarController?.viewControllers![0] as! UINavigationController
        listMakeDelegate = nav.viewControllers[0] as! ListViewController
    }
    
    @IBAction func tapListAddBtn(){
        listMakeDelegate.addListRandom(number: 10)
    }
}
