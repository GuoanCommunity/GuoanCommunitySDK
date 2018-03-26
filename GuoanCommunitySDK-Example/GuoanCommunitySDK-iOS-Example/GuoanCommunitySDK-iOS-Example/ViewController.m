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
        userInfo.token = @"token";
        return userInfo;
    }];
}

- (void)button0Click {
    [GuoanCommunity intoCommunityHome:self];
}

- (void)button1Click {
    [GuoanCommunity intoCommunity:self urlString: @"http://demo.mulpush.cn/community"];
}

@end
