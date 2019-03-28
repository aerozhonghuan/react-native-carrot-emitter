//
//  RNListenerManager.m
//  RNCarrotEmitter
//
//  Created by 王金志 on 2019/3/27.
//  Copyright © 2019 LP. All rights reserved.
//

#import "RNListenerManager.h"
#import "RNNotificationManager.h"

@implementation RNListenerManager
RCT_EXPORT_MODULE();

+ (void)OCsendMessage:(NSDictionary *)dictionary
{
    [[NSNotificationCenter defaultCenter] postNotificationName:dictionary[@"name"] object:nil userInfo:dictionary];
}

- (NSArray<NSString *> *)supportedEvents
{
    return [RNNotificationManager shareNotification].ListenerNameArr;;
}
// 开启通知
-(void)startObserving {
    NSString *notifiName = [RNNotificationManager shareNotification].CurrentListenerName;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(OCSendToReactNative:) name:notifiName
                                               object:nil];
}
// 移除通知
/**
 * 经过代码测试 如果jsx端调用了相应的remove方法，则会移除jsx端的对应的addListener的监听（即使iOS端调用NSNotificationCenter的相关方法也无法与jsx进行通信 与 iOS端的NSNotificationCenter 监听与否没有关系）
 */
-(void)stopObserving
{
    NSString *notifiName = [RNNotificationManager shareNotification].CurrentRemoveListenerName;
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:notifiName
                                                  object:nil];
}
#pragma mark - 通知的执行方法
// 更新我的页面的数据
-(void)OCSendToReactNative:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sendEventWithName:notification.userInfo[@"name"] body:notification.userInfo];
    });
}
@end
