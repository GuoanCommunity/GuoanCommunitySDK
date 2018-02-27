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
    
    [GuoanCommunity intoCommunityHome:self];
}

@end
