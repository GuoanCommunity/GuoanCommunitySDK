//
//  GuoanCommunityStoreInfo.h
//  GuoanCommunitySDK
//
//  Created by OctMon on 2018/4/12.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuoanCommunityStoreInfo : NSObject

@property (nonatomic, strong) NSString * storeId;
@property (nonatomic, strong) NSString * storeName;
@property (nonatomic, strong) NSString * storeScheme;

- (NSDictionary *)toDictionary;

@end
