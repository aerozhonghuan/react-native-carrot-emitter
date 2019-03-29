
# react-native-carrot-emitter

## Getting started

`$ npm install react-native-carrot-emitter --save`

### Mostly automatic installation

`$ react-native link react-native-carrot-emitter`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-carrot-emitter` and add `RNCarrotEmitter.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCarrotEmitter.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.carrot.emitter.RNCarrotEmitterPackage;` to the imports at the top of the file
  - Add `new RNCarrotEmitterPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-carrot-emitter'
  	project(':react-native-carrot-emitter').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-carrot-emitter/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-carrot-emitter')
  	```

## API
| 方法名（js端调用，带有native方法为跨原生容器时调用） | 参数 | 描述 |
|:-----:|:------:|:-----:|
| addNativeListener | name: string, listenerResult: (param?: any) => void | JS端添加监听 |
| removeNativeListener | name: string | JS端移除监听 |
| nativeEmit | name: string, params?:string | JS端发送监听内容|
| addRNListener | name: string, listenerResult: (param?: any) => void | JS端添加监听 |
| removeRNListener |  | JS端移除监听 |
| RNEmit | name: string, params?:string | JS端发送监听内容|

| 方法名（iOS或andriod原生端调用） | 参数 | 描述 |
|:-----:|:------:|:-----:|
| OCsendMessage | dictionary（字典里必须带有name：" " 声明监听名的键值对） | iOS端发送消息 |
| postEventToJS | context: ReactContext, event: String | andriod端发送消息 |

## Usage

``` javascript
import CarrotEmitter from 'react-native-carrot-emitter';
// 添加监听
componentDidMount() {
  CarrotEmitter.addNativeListener('changeInfo', (param) => {
      if (param.key === 'nameChange') {
         this.setState({
           name: param.info,
       });
      }
   }
}
// 移除监听
componentWillUnmount() {
  CarrotEmitter.removeNativeListener('changeInfo');
}


// 发送监听
import CarrotEmitter from 'react-native-carrot-emitter';
CarrotEmitter.nativeEmit('changeInfo', { key: 'nameChange', info: name });


如果是rn容器间的消息传递 则使用 对应的 RN方法（addRNListener、removeRNListener、RNEmit）
```
### iOS端给js发送消息
* 1 `#import "RNListenerManager.h"`
* 2 `[RNListenerManager OCsendMessage:@{@"info":@"", @"name":@"refreshHome"}];`

### android端给js发送消息
调用`postEventToJS`
方法名：`public void postEventToJS(ReactContext context, String event)`
  
