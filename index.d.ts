declare module "react-native-carrot-emitter" {
    class CarrotEmitter {
        /**
         * @description: RN容器间的消息监听添加
         * @param name 监听名
         * @param listenerResult func
         * @return:void
         */
        static addRNListener(name: string, listenerResult: (param?: any) => void): void;

        /**
         * @description: RN容器间的消息监听移除
         * @return: void
         */
        static removeRNListener(): void;
        /**
         * @description: RN容器间的消息发送
         * @param name 需要传递信息的监听名
         * @param params 传递的参数
         * @return: void
         */
        static RNEmit(name: string, params?:string): void;

        /**
         * @description: 跨iOS容器的消息监听添加
         * @param name 监听名
         * @param listenerResult func
         * @return:void
         */
        static addNativeListener(name: string, listenerResult: (param?: any) => void): void;

        /**
         * @description: 跨iOS容器的消息监听移除
         * @param name 需要移除的监听名
         * @return:void
         */
        static removeNativeListener(name: string): void;

        /**
         * @description: 跨iOS容器的消息发送
         * @param name 需要传递信息的监听名
         * @param params 传递的参数
         * @return: void
         */
        static nativeEmit(name: string, params?:string): void;
    };
    export=CarrotEmitter
}