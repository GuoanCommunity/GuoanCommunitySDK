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
        
        let button = UIButton()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 22)
        button.center = view.center
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitle("openSDK", for: .normal)
        button.addTarget(self, action: #selector(openSDK), for: .touchUpInside)
        
        GuoanCommunity.onTryLoginHandler {
            print("去登录");
        }
        
        GuoanCommunity.onShareHandler { (title, desc, link, imgUrl) in
            print("去分享", title ?? "", desc ?? "", link ?? "", imgUrl ?? "")
        }
    }
    
    @objc func openSDK() {
        GuoanCommunity.intoCommunityHome(self)
    }

}
