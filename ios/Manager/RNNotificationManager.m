//
//  RNNotificationManager.m
//  RNCarrotEmitter
//
//  Created by 王金志 on 2019/3/27.
//  Copyright © 2019 LP. All rights reserved.
//

#import "RNNotificationManager.h"

@implementation RNNotificationManager
static RNNotificationManager *instance = nil;

+(RNNotificationManager *) shareNotification{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

+(id) allocWithZone:(struct _NSZone*)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });    return instance;
}

- (NSMutableArray *)ListenerNameArr{
    if (!_ListenerNameArr) {
        _ListenerNameArr = [NSMutableArray array];
    }
    return _ListenerNameArr;
}
@end
