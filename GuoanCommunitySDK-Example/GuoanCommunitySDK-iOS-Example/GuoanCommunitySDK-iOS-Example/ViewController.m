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
    
    [GuoanCommunity onGetStoreInfoHandler:^GuoanCommunityStoreInfo *{
        GuoanCommunityStoreInfo *storeInfo = [[GuoanCommunityStoreInfo alloc] init];
        storeInfo.cityCode = @"010";
        storeInfo.storeId = @"00000000000000000000000000000034";
        storeInfo.storeName = @"社区门店";
        storeInfo.storeScheme = @"normal";
        return storeInfo;
    }];
    
    [GuoanCommunity onGetTempAddressHandler:^GuoanCommunityLocation *{
        GuoanCommunityLocation *location = [[GuoanCommunityLocation alloc] init];
        location.cityCode = @"010";
        location.lat = 39.921636;
        location.lon = 116.460813;
        return location;
    }];
    
    [GuoanCommunity onGetUserAddressListHandler:^NSArray *{
        return [[NSArray alloc] initWithObjects:@{
                                                   @"id" : @"92bcbd9694ab4205b63c6e8fbced5cb5",
                                                   @"storeId" : @"00000000000000000000000000000034",
                                                   @"mobilephone" : @"13012345678",
                                                   @"adName" : @"朝阳区",
                                                   @"cityName" : @"北京市",
                                                   @"shoppingCartCount" : @16,
                                                   @"defaultFlg" : @"no",
                                                   @"longitude" : @116.461,
                                                   @"provinceCode" : @"110000",
                                                   @"latitude" : @39.9221,
                                                   @"cityCode" : @"010",
                                                   @"customerId" : @"02cce689060945a4a6d6613ba863e98b",
                                                   @"detailAddress" : @"1楼",
                                                   @"placename" : @"关东店北街11号楼",
                                                   @"provinceName" : @"北京市",
                                                   @"adCode" : @"110105",
                                                   @"name" : @"王女士"
                                                   }, nil];
    }];
    
    [GuoanCommunity onPayHandler:^(NSString *callbackId, NSString *orderId, double amount) {
        NSLog(@"回调id：%@订单id：%@订单金额：%.2f", callbackId, orderId, amount);
        [GuoanCommunity messageFromNativeStatus:success callbackId:callbackId];
    }];
    
    [GuoanCommunity onJumpNativeHandler:^(NSString *type, NSString *param) {
        NSLog(@"type：%@  param：%@f", type, param);
    }];
}

- (void)button0Click {
    [GuoanCommunity intoCommunityHome:self];
}

- (void)button1Click {
    [GuoanCommunity intoCommunity:self navigationBarHidden:YES urlString:@"http://demo.mulpush.cn/community"];
}

@end
