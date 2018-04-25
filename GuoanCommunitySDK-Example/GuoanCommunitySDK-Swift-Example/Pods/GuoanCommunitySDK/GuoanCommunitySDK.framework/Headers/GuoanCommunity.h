//
//  GuoanCommunity.h
//  GuoanCommunitySDK
//
//  Created by OctMon on 2018/2/9.
//  Copyright © 2018年 Guoan Community (Beijing) Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GuoanCommunityUserInfo.h"
#import "GuoanCommunityStoreInfo.h"
#import "GuoanCommunityLocation.h"

/**
 回调状态
 
 - succes: 成功
 - fail: 失败
 - cancel: 取消
 */
typedef NS_ENUM(NSUInteger, GuoanCommunityCallbackStatus) {
    success = 0,
    fail,
    cancel
};

@interface GuoanCommunity : NSObject

/**
 设置平台的appkey

 @param appKey appKey
 @param appSecret appSecret
 */
+ (void)setAppKey:(NSString *)appKey appSecret:(NSString *)appSecret;

+ (void)setLogEnabled:(BOOL)value;

/**
 设置是否打印sdk的log信息, 默认NO(不打印log).

 @param format 设置为YES会输出log信息可供调试参考.除非特殊需要,否则发布产品时需改回NO.
 */
+ (void)log:(NSString *)format, ...;

/**
 跳转到SDK首页

 @param current 宿主控制器
 */
+ (void)intoCommunityHome:(UIViewController *)current;

/**
 跳转到SDK指定H5页面
 
 @param current 当前控制器
 @param navigationBarHidden 是否隐藏原生导航
 @param urlString H5链接地址
 */
+ (void)intoCommunity:(UIViewController *)current navigationBarHidden:(bool)navigationBarHidden urlString:(NSString *)urlString;

/**
 获取sdk版本号

 @return 版本
 */
+ (NSString *)sdkVersion;

/**
 调起宿主关闭SDK
 
 @param handler 回调
 */
+ (void)onCloseCommunityHandler:(void(^)(void))handler;

/**
 调起宿主登录

 @param handler 回调
 */
+ (void)onTryLoginHandler:(void(^)(void))handler;

/**
 调起宿主获取用户信息
 
 @param handler 回调
 */
+ (void)onGetUserInfoHandler:(GuoanCommunityUserInfo *(^)(void))handler;

/**
 调起宿主获取门店信息
 
 @param handler 回调
 */
+ (void)onGetStoreInfoHandler:(GuoanCommunityStoreInfo *(^)(void))handler;

/**
 调起宿主获取位置信息

 @param handler 回调
 */
+ (void)onGetTempAddressHandler:(GuoanCommunityLocation *(^)(void))handler;

/**
 调起宿主获取地址列表信息
 
 @param handler 回调
 */
+ (void)onGetUserAddressListHandler:(NSArray *(^)(void))handler;

/**
 调起宿主分享

 @param handler 回调 (NSString *title, NSString *desc, NSString *link, NSString *imgUrl)
 */
+ (void)onShareHandler:(void (^)(NSString *title, NSString *desc, NSString *link, NSString *imgUrl))handler;

/**
 调起宿主支付
 
 @param handler 回调 (NSString *callbackId, NSString *orderId, double amount)
 */
+ (void)onPayHandler:(void (^)(NSString *callbackId, NSString *orderId, double amount))handler;

/**
 结果回调给H5

 @param status 回调状态
 @param callbackId 回调id
 */
+ (void)messageFromNativeStatus:(GuoanCommunityCallbackStatus)status callbackId:(NSString *)callbackId;

/**
 调起跳转原生页面

 @param handler 回调(NSString *type, NSString *param)
 */
+ (void)onJumpNativeHandler:(void (^)(NSString *type, NSString *param))handler;

@end
