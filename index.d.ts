declare module "react-native-app-test" {

    class appTest {
        static addNativeListener(name: string, listenerResult: (param?: any) => void): void;
        static removeNativeListener(name: string): void;
        static nativeEmit(name: string, params?:string): void;
    };
    export=appTest
}