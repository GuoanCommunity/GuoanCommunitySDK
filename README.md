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
GuoanCommunity.intoCommunity(self, urlString: "http://...")

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
```

## Author

octmon, octmon@qq.com

## License

GuoanCommunitySDK is available under the MIT license. See the LICENSE file for more info.
