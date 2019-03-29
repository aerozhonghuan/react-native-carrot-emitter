
package com.carrot.emitter;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class RNCarrotEmitterModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNCarrotEmitterModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNCarrotEmitter";
  }

  public void postEventToJS(ReactContext context, String event) {
    context.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
            .emit(event, null);
  }

}