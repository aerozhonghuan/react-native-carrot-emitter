//
//  RNNotificationManager.h
//  RNCarrotEmitter
//
//  Created by 王金志 on 2019/3/27.
//  Copyright © 2019 LP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNNotificationManager : NSObject
//类方法
+ (RNNotificationManager *) shareNotification;
// 当前需要添加监听的名称
@property (nonatomic, copy, nullable) NSString *CurrentListenerName;
// 当前需要移除监听的名称
@property (nonatomic, copy, nullable) NSString *CurrentRemoveListenerName;
// 需要注册到supportedEvents中的通知
@property (nonatomic, strong, nullable) NSMutableArray *ListenerNameArr;

@end

NS_ASSUME_NONNULL_END
