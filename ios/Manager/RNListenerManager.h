//
//  RNListenerManager.h
//  RNCarrotEmitter
//
//  Created by 王金志 on 2019/3/27.
//  Copyright © 2019 LP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNListenerManager : RCTEventEmitter<RCTBridgeModule>
+ (void)OCsendMessage:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
