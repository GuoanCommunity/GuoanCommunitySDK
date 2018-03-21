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
    
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"openSDK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openSDK) forControlEvents:UIControlEventTouchUpInside];
    
    [GuoanCommunity onTryLoginHandler:^{
        NSLog(@"去登录");
    }];
    
    [GuoanCommunity onShareHandler:^(NSString *title, NSString *desc, NSString *link, NSString *imgUrl) {
        NSLog(@"去分享%@, %@, %@, %@", title, desc, link, imgUrl);
    }];
}

- (void)openSDK {
    [GuoanCommunity intoCommunityHome:self];
}

@end
