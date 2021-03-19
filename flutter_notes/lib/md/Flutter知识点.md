### stf 声明周期[https://www.jianshu.com/p/6ed6f7de01ff]

createState

initState

didChangeDependencies//该函数是在该组件依赖的 State 发生变化时，这里说的 State 为全局 State ，例如语言或者主题等，类似于前端 Redux 存储的 State 。这个方法在两种情况下会调用：
                       情况一：调用initState会调用；
                       情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget；

build

didUpdateWidget//该函数主要是在组件重新构建，比如说热重载,父组件发生 build 的情况下，子组件该方法才会被调用，其次该方法调用之后一定会再调用本组件中的 build 方法。

deactivate ，在组件被移除节点后会被调用，如果该组件被移除节点，然后未被插入到其他节点时，则会继续调用 dispose 永久移除。

dispose ，永久移除组件，并释放组件资源。