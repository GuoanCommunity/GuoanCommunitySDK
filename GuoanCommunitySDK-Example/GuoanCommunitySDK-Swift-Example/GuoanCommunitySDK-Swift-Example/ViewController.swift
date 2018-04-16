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
            userInfo.token = "customer_app_72adbdb11637632a4ee770ec53803e19"
            return userInfo
        }
        
        GuoanCommunity.onGetTempAddress { () -> GuoanCommunityLocation? in
            let location = GuoanCommunityLocation()
            location.cityCode = "010"
            location.lat = 39.921636
            location.lon = 116.460813
            return location
        }
        
        GuoanCommunity.onGetUserAddressList { () -> String? in
            return "[{\"id\":\"e05a7f8d60384f69b598448979404bf1\",\"storeId\":\"00000000000000000000000000000034\",\"mobilephone\":\"13800000000\",\"adName\":\"朝阳区\",\"cityName\":\"北京市\",\"shoppingCartCount\":0,\"defaultFlg\":\"yes\",\"longitude\":116.46281433,\"provinceCode\":\"110000\",\"latitude\":39.92126846,\"cityCode\":\"010\",\"customerId\":\"308057e8d4b844b7bc83a7e7050317f9\",\"detailAddress\":\"测试小区\",\"placename\":\"北京国际中心\",\"provinceName\":\"北京市\",\"adCode\":\"110105\",\"name\":\"测试\"}]"
        }
        
        GuoanCommunity.onGetStoreInfoHandler { () -> GuoanCommunityStoreInfo? in
            let store = GuoanCommunityStoreInfo()
            store.cityCode = "010"
            store.storeId = "00000000000000000000000000000034"
            store.storeName = "社区门店"
            store.storeScheme = "normal"
            return store
        }
        
        GuoanCommunity.onPay { (callbackId, orderId, amount) in
            print("回调id", callbackId ?? "", "订单id", orderId ?? "", "订单金额", amount)
            
            GuoanCommunity.message(fromNativeStatus: .success, callbackId: callbackId)
        }
    }
    
    @objc func button0Click() {
        GuoanCommunity.intoCommunityHome(self)
    }
    
    @objc func button1Click() {
        GuoanCommunity.intoCommunity(self, navigationBarHidden: true, urlString: "http://demo.mulpush.cn/community")
    }

}
