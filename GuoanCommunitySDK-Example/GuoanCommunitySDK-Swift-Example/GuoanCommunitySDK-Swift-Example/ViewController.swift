//
//  ViewController.swift
//  GuoanCommunitySDK-Swift-Example
//
//  Created by OctMon on 2018/2/11.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

import UIKit
import GuoanCommunitySDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temporaryBarButtonItem = UIBarButtonItem()
        temporaryBarButtonItem.title = title ?? ""
        navigationItem.backBarButtonItem = temporaryBarButtonItem
        
        self.title = "GuoanCommunitySDK Example"
        
        GuoanCommunity.intoCommunityHome(self)
    }


}

