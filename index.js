/**
 * @Description:carrotEmitter
 * @Author: lp1
 * @LastEditors: lp1
 * @Date: 2019/3/27 1:50 PM
 * @LastEditTime: 2019/3/27 1:50 PM
 */
import {
    NativeModules,
    Platform,
    DeviceEventEmitter,
    NativeEventEmitter,
} from 'react-native';

const { RNCarrotEmitter, RNListenerManager } = NativeModules;
const listenerManager = new NativeEventEmitter(RNListenerManager);

export default class CarrotEmitter {
    /* 不涉及iOS跨容器的消息传递 方法使用 */
  /**
   *  注册监听
   */
  static addRNListener = (name, listenerResult) => {
      DeviceEventEmitter.addListener(name, listenerResult);
  };

  /**
   * 移除监听
   */
  static removeRNListener = () => {
      DeviceEventEmitter.remove();
  };

  /**
   * 发送消息
   */
  static RNEmit = (name, params) => {
      if (params) {
          DeviceEventEmitter.emit(name, params);
      } else {
          DeviceEventEmitter.emit(name, null);
      }
  };

  /* 原生之间的通信方法 主要针对iOS iOS和安卓针对不同原生容器之间的消息传递实现不一样，所以需要做定制化的方法处理 */
  /**
   *  注册监听
   */
  static addNativeListener = (name, listenerResult) => {
      if (Platform.OS === 'android') {
          DeviceEventEmitter.addListener(name, listenerResult);
      } else {
          CarrotEmitter.addiOSListener(name, listenerResult);
      }
  };

  /**
   * 移除监听
   */
  static removeNativeListener = (name) => {
      if (Platform.OS === 'android') {
          DeviceEventEmitter.remove();
      } else {
          CarrotEmitter.removeiOSListener(name);
      }
  };

  /**
   * 发送消息
   */
  static nativeEmit = (name, params) => {
      if (Platform.OS === 'android') {
          if (params) {
              DeviceEventEmitter.emit(name, params);
          } else {
              DeviceEventEmitter.emit(name, null);
          }
      } else if (params) {
          RNCarrotEmitter.notification(name, params);
      } else {
          RNCarrotEmitter.notification(name, null);
      }
  };

  /**
   * ios 相关
   */
  // 添加iOS通知
  static addiOSListener = async (name, listenerResult) => {
      await RNCarrotEmitter.notificationName(name);
      listenerManager.addListener(name, listenerResult);
  };

  // 移除iOS通知
  static removeiOSListener = async (name) => {
      await RNCarrotEmitter.removeNotificationName(name);
      listenerManager.remove();
  }
}
