//
//  GuoanCommunityUserInfo.h
//  GuoanCommunitySDK
//
//  Created by OctMon on 2018/3/22.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuoanCommunityUserInfo : NSObject

@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *mobilephone;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *token;

- (NSDictionary *)toDictionary;

@end
