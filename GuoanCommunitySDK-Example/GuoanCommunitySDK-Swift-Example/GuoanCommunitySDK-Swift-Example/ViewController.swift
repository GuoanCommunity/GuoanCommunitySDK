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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    private let dataSource = [("open GuoanCommunity SDK", ""), ("open GuoanCommunity TouTiao", "https://tt.guoanshequ.cn/"), ("open GuoanCommunity Membership", "http://wx.guoanshequ.ren/dev-wx_js_bundle/membership/#/"), ("open GuoanCommunity lvyou", "http://ly.guoanshequ.top:8021/h5/index.htm")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temporaryBarButtonItem = UIBarButtonItem()
        temporaryBarButtonItem.title = title ?? ""
        navigationItem.backBarButtonItem = temporaryBarButtonItem
        
        self.title = "GuoanCommunitySDK Example"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        GuoanCommunity.onTryLoginHandler { (callbackId) in
            print("去登录")
            GuoanCommunity.message(fromNativeStatus: .success, callbackId: callbackId)
        }
        
        GuoanCommunity.onShareHandler { (callbackId, title, desc, link, imgUrl) in
            print("去分享", title ?? "", desc ?? "", link ?? "", imgUrl ?? "")
        }
        
        GuoanCommunity.onGetUserInfoHandler { (callbackId) -> GuoanCommunityUserInfo? in
            let userInfo = GuoanCommunityUserInfo()
            userInfo.nickname = "nickname"
            userInfo.imgUrl = "https://imgcdn.guoanshequ.com/pad/bbld76adw738x5o91fu9tiqy6zm1gkq7.png"
            userInfo.mobilephone = "13800000000"
            userInfo.token = "customer_app_61181e3c455fd200caaaf24a58233de7"
            return userInfo
        }
        
        GuoanCommunity.onGetTempAddressHandler { (callbackId) -> GuoanCommunityLocation? in
            let location = GuoanCommunityLocation()
            location.cityCode = "010"
            location.lat = 39.921636
            location.lon = 116.460813
            return location
        }
        
        GuoanCommunity.onGetUserAddressListHandler { (callbackId) -> [Any]? in
            return [
                [
                    "id" : "92bcbd9694ab4205b63c6e8fbced5cb5",
                    "storeId" : "00000000000000000000000000000034",
                    "mobilephone" : "13012345678",
                    "adName" : "朝阳区",
                    "cityName" : "北京市",
                    "shoppingCartCount" : 16,
                    "defaultFlg" : "no",
                    "longitude" : 116.461,
                    "provinceCode" : "110000",
                    "latitude" : 39.9221,
                    "cityCode" : "010",
                    "customerId" : "02cce689060945a4a6d6613ba863e98b",
                    "detailAddress" : "1楼",
                    "placename" : "关东店北街11号楼",
                    "provinceName" : "北京市",
                    "adCode" : "110105",
                    "name" : "王女士"
                ],
                [
                    "id" : "e382fab8e2154ee6b8526ee85519b769",
                    "storeId" : "00000000000000000000000000000y27",
                    "mobilephone" : "13012345678",
                    "adName" : "朝阳区",
                    "cityName" : "北京市",
                    "shoppingCartCount" : 0,
                    "defaultFlg" : "no",
                    "longitude" : 116.38380432,
                    "provinceCode" : "110000",
                    "latitude" : 40.00824738,
                    "cityCode" : "010",
                    "customerId" : "02cce689060945a4a6d6613ba863e98b",
                    "detailAddress" : "2楼",
                    "placename" : "国奥村东区",
                    "provinceName" : "北京市",
                    "adCode" : "110105",
                    "name" : "李先生"
                ]
            ]
        }
        
        GuoanCommunity.onGetStoreInfoHandler { (callbackId) -> GuoanCommunityStoreInfo? in
            let store = GuoanCommunityStoreInfo()
            store.cityCode = "010"
            store.storeId = "00000000000000000000000000000034"
            store.storeName = "社区门店"
            store.storeScheme = "normal"
            return store
        }
        
        GuoanCommunity.onGetStoreInfoListHandler { (callbackId) -> [GuoanCommunityStoreInfo]? in
            let store1 = GuoanCommunityStoreInfo()
            store1.cityCode = "010"
            store1.storeId = "00000000000000000000000000000034"
            store1.storeName = "社区门店"
            store1.storeScheme = "normal"
            
            let store2 = GuoanCommunityStoreInfo()
            store2.cityCode = "010"
            store2.storeId = "00000000000000000000000000000035"
            store2.storeName = "前置仓门店"
            store2.storeScheme = "front"
            
            return [store1, store2]
        }
        
        GuoanCommunity.onPayHandler { (callbackId, type, orderId, amount, ext) in
            print("回调id", callbackId ?? "", "type", type ?? "", "订单id", orderId ?? "", "订单金额", amount, "ext", ext ?? [:])
            
            GuoanCommunity.message(fromNativeStatus: .success, callbackId: callbackId)
        }
        
        GuoanCommunity.onJumpNativeHandler { (callbackId, type, param) in
            print("type =", type ?? "", "param =", param ?? "")
            
            switch type {
            case "webSDK":
                GuoanCommunity.intoCommunity(self, navigationBarHidden: true, urlString: param)
            case "webSDKWithNav":
                GuoanCommunity.intoCommunity(self, navigationBarHidden: false, urlString: param)
            default:
                break
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = dataSource[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if dataSource[indexPath.row].1.isEmpty {
            GuoanCommunity.intoCommunityHome(self)
        } else {
            GuoanCommunity.intoCommunity(self, navigationBarHidden: true, urlString: dataSource[indexPath.row].1)
        }
    }
    
}
