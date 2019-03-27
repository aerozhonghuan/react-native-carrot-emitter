 /**
   * @Description: RNCarrotEmitter.h
   * @Author: lp1
   * @LastEditors: lp1
   * @Date: 2019/3/27 1:52 PM
   * @LastEditTime: 2019/3/27 1:52 PM
  */
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNCarrotEmitter : NSObject <RCTBridgeModule>

@end
  