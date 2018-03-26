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
        
        let button0 = UIButton()
        view.addSubview(button0)
        button0.frame = CGRect(x: 0, y: 0, width: 300, height: 22)
        button0.center = view.center
        button0.setTitleColor(UIColor.red, for: .normal)
        button0.setTitle("openGuoanCommunitySDK", for: .normal)
        button0.addTarget(self, action: #selector(button0Click), for: .touchUpInside)
        
        let button1 = UIButton()
        view.addSubview(button1)
        button1.frame = CGRect(x: 0, y: 0, width: 300, height: 22)
        button1.center = CGPoint(x: view.center.x, y: view.center.y + 50)
        button1.setTitleColor(UIColor.red, for: .normal)
        button1.setTitle("openTouTiao", for: .normal)
        button1.addTarget(self, action: #selector(button1Click), for: .touchUpInside)
        
        GuoanCommunity.onTryLoginHandler {
            print("去登录");
        }
        
        GuoanCommunity.onShareHandler { (title, desc, link, imgUrl) in
            print("去分享", title ?? "", desc ?? "", link ?? "", imgUrl ?? "")
        }
        
        GuoanCommunity.onGetUserInfoHandler { () -> GuoanCommunityUserInfo? in
            let userInfo = GuoanCommunityUserInfo()
            userInfo.nickname = "nickname"
            userInfo.imgUrl = "https://imgcdn.guoanshequ.com/pad/bbld76adw738x5o91fu9tiqy6zm1gkq7.png"
            userInfo.mobilephone = "13800000000"
            userInfo.token = "token"
            return userInfo
        }
    }
    
    @objc func button0Click() {
        GuoanCommunity.intoCommunityHome(self)
    }
    
    @objc func button1Click() {
        GuoanCommunity.intoCommunity(self, urlString: "http://demo.mulpush.cn/community")
    }

}
