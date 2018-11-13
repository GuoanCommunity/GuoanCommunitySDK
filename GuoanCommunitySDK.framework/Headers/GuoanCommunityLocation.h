//
//  GuoanCommunityLocation.h
//  GuoanCommunitySDK
//
//  Created by OctMon on 2018/3/28.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuoanCommunityLocation : NSObject

@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *locAddress;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lon;

- (NSDictionary *)toDictionary;

@end
