 /**
   * @Description: RNCarrotEmitter.m
   * @Author: lp1
   * @LastEditors: lp1
   * @Date: 2019/3/27 1:51 PM
   * @LastEditTime: 2019/3/27 1:51 PM
  */
#import "RNCarrotEmitter.h"
#import <Foundation/Foundation.h>
#import "RNListenerManager.h"
#import "RNNotificationManager.h"
#import <React/RCTLog.h>

@implementation RNCarrotEmitter

RCT_EXPORT_MODULE()
/**
 * 发送消息
 */
RCT_EXPORT_METHOD(notification:(NSString *)name notificationInfo:(NSDictionary *)info ) {
    if (name && name.length > 0) {
        // 判断传入的是否为空name
        if (info) {
            [RNListenerManager OCsendMessage:@{@"key":info[@"key"], @"info":info[@"info"], @"name":name}];
        } else {
            [RNListenerManager OCsendMessage:@{@"name":name}];
        }
    } else {
        RCTLogError(@"name is not a supported when it`s null or """);
    }
}
/**
 * 添加消息的名称
 * 将消息的名称通过 RCTEventEmitter类的startObserving注册进去
 */
RCT_EXPORT_METHOD(notificationName:(NSString *)name){
    if (name && name.length > 0) {
        // 判断传入的是否为空name
        RNNotificationManager *manager = [RNNotificationManager shareNotification];
        manager.CurrentListenerName = name;
        
        if(![manager.ListenerNameArr containsObject:name]) {
            // 如果本地不存在 则 添加
            [manager.ListenerNameArr addObject:name];
        } else {
            // 否则移除对应的notification 避免 重复添加
            [[NSNotificationCenter defaultCenter] removeObserver:self
                                                            name:name
                                                          object:nil];
        }
    } else {
        RCTLogError(@"name is not a supported when it`s null or """);
    }
    
}
/**
 * 移除消息
 * 将消息的名称通过 RCTEventEmitter类的stopObserving移除出去
 */
RCT_EXPORT_METHOD(removeNotificationName:(NSString *)name){
    if (name && name.length > 0) {
        // 判断传入的是否为空name
        RNNotificationManager *manager = [RNNotificationManager shareNotification];
        manager.CurrentRemoveListenerName = name;
        if(![manager.ListenerNameArr containsObject:name]) {
            // 如果本地不存在 则 添加
            [manager.ListenerNameArr removeObject:name];
        }
    } else {
        RCTLogError(@"name is not a supported when it`s null or """);
    }
   
}
@end
  
