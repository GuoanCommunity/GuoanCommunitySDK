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
// 打开国安社区
GuoanCommunity.intoCommunityHome(self)

GuoanCommunity.onTryLoginHandler {
    print("去登录");
}
        
GuoanCommunity.onShareHandler { (title, desc, link, imgUrl) in
    print("去分享", title ?? "", desc ?? "", link ?? "", imgUrl ?? "")
}
```

## Author

octmon, octmon@qq.com

## License

GuoanCommunitySDK is available under the MIT license. See the LICENSE file for more info.
