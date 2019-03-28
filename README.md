
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


## Usage
### 关于react-native-carrot-emitter
#### API
| 方法名（native方法都是用于跨原生容器使用） | 参数 | 描述 |
|:-----:|:------:|:-----:|
| addNativeListener | name: string, listenerResult: (param?: any) => void | RN端添加监听 |
| removeNativeListener | name: string | RN端移除监听 |
| nativeEmit | name: string, params?:string | RN端发送监听内容|
| addRNListener | name: string, listenerResult: (param?: any) => void | RN端添加监听 |
| removeRNListener |  | RN端移除监听 |
| RNEmit | name: string, params?:string | RN端发送监听内容|
#### Detail
```
import CarrotEmitter from 'react-native-carrot-emitter';
监听页 ------- iOS 跨容器
componentDidMount() {
CarrotEmitter.addNativeListener('changeInfo', (param) => {
console.log(`通知${param.key}`);
if (param.key === 'nameChange') {
this.setState({
name: param.info,
});
}
if (param.key === 'phoneChange') {
this.setState({
phone: param.info,
});
}
});
}

componentWillUnmount() {
CarrotEmitter.removeNativeListener('changeInfo');
}
监听页 ------- iOS 跨容器

发送页 ------- iOS 跨容器
import CarrotEmitter from 'react-native-carrot-emitter';
CarrotEmitter.nativeEmit('changeInfo', { key: 'nameChange', info: name });
发送页 ------- iOS 跨容器

如果是rn容器间的消息传递 则使用 对应的 RN方法（addRNListener、removeRNListener、RNEmit）
```
  
