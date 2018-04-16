//
//  GuoanCommunityStoreInfo.h
//  GuoanCommunitySDK
//
//  Created by OctMon on 2018/4/12.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuoanCommunityStoreInfo : NSObject

@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *storeId;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSString *storeScheme;

- (NSDictionary *)toDictionary;

@end
