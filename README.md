# GuoanCommunitySDK

[![Version](https://img.shields.io/cocoapods/v/GuoanCommunitySDK.svg?style=flat)](http://cocoapods.org/pods/GuoanCommunitySDK)
[![License](https://img.shields.io/cocoapods/l/GuoanCommunitySDK.svg?style=flat)](http://cocoapods.org/pods/GuoanCommunitySDK)
[![Platform](https://img.shields.io/cocoapods/p/GuoanCommunitySDK.svg?style=flat)](http://cocoapods.org/pods/GuoanCommunitySDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Example App](https://www.pgyer.com/app/qrcode/gcsdk)

[Example App](https://www.pgyer.com/gcsdk)

## Requirements

- iOS 8.0+
- Xcode 9+

## Installation

GuoanCommunitySDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GuoanCommunitySDK'
```

## Get Started

```swift
// 打开日志
GuoanCommunity.setLogEnabled(true)
// 注册SDK
GuoanCommunity.setAppKey("", appSecret: "")
// 打开国安社区首页
GuoanCommunity.intoCommunityHome(self)
// 打开指定页面
GuoanCommunity.intoCommunity(self, navigationBarHidden: true, urlString: "http://...")

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

GuoanCommunity.onPayHandler { (callbackId, type, orderId, amount, ext) in
    print("回调id", callbackId ?? "", "type", type ?? "", "订单id", orderId ?? "", "订单金额", amount, "ext", ext ?? [:])
    
    GuoanCommunity.message(fromNativeStatus: .success, callbackId: callbackId)
}

GuoanCommunity.onJumpNativeHandler { (callbackId, type, param) in
    print("type =", type ?? "", "param =", param ?? "")
}
```

## Author

octmon, octmon@qq.com

## License

GuoanCommunitySDK is available under the MIT license. See the LICENSE file for more info.
