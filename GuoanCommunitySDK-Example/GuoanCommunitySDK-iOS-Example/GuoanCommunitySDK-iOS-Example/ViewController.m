//
//  ViewController.m
//  GuoanCommunitySDK-iOS-Example
//
//  Created by OctMon on 2018/2/9.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import <GuoanCommunitySDK/GuoanCommunitySDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    [temporaryBarButtonItem setTitle: self.navigationItem.title];
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    self.title = @"GuoanCommunitySDK Example";
    
    UIButton *button0 = [[UIButton alloc] init];
    [self.view addSubview:button0];
    button0.frame = CGRectMake(0, 0, 300, 50);
    button0.center = self.view.center;
    [button0 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button0 setTitle:@"openGuoanCommunitySDK" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(button0Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] init];
    [self.view addSubview:button1];
    button1.frame = CGRectMake(0, 0, 300, 50);
    button1.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button1 setTitle:@"openTouTiao" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    
    [GuoanCommunity onTryLoginHandler:^{
        NSLog(@"去登录");
    }];
    
    [GuoanCommunity onShareHandler:^(NSString *title, NSString *desc, NSString *link, NSString *imgUrl) {
        NSLog(@"去分享%@, %@, %@, %@", title, desc, link, imgUrl);
    }];
    
    [GuoanCommunity onGetUserInfoHandler:^GuoanCommunityUserInfo *{
        GuoanCommunityUserInfo *userInfo = [[GuoanCommunityUserInfo alloc] init];
        userInfo.nickname = @"nickname";
        userInfo.imgUrl = @"https://imgcdn.guoanshequ.com/pad/bbld76adw738x5o91fu9tiqy6zm1gkq7.png";
        userInfo.mobilephone = @"13800000000";
        userInfo.token = @"customer_app_72adbdb11637632a4ee770ec53803e19";
        return userInfo;
    }];
    
    [GuoanCommunity onGetTempAddress:^GuoanCommunityLocation *{
        GuoanCommunityLocation *location = [[GuoanCommunityLocation alloc] init];
        location.cityCode = @"010";
        location.lat = 39.921636;
        location.lon = 116.460813;
        return location;
    }];
    
    [GuoanCommunity onGetUserAddressList:^NSString *{
        return @"[{\"id\":\"e05a7f8d60384f69b598448979404bf1\",\"storeId\":\"00000000000000000000000000000034\",\"mobilephone\":\"13800000000\",\"adName\":\"朝阳区\",\"cityName\":\"北京市\",\"shoppingCartCount\":0,\"defaultFlg\":\"yes\",\"longitude\":116.46281433,\"provinceCode\":\"110000\",\"latitude\":39.92126846,\"cityCode\":\"010\",\"customerId\":\"308057e8d4b844b7bc83a7e7050317f9\",\"detailAddress\":\"测试小区\",\"placename\":\"北京国际中心\",\"provinceName\":\"北京市\",\"adCode\":\"110105\",\"name\":\"测试\"}]";
    }];
}

- (void)button0Click {
    [GuoanCommunity intoCommunityHome:self];
}

- (void)button1Click {
    [GuoanCommunity intoCommunity:self urlString: @"http://demo.mulpush.cn/community"];
}

@end
