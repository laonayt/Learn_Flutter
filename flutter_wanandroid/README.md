# flutter_wanandroid

- 类方法？
ListView.builder(),

- 空安全
    - 必须初始化，否则是把null赋值给变量？
    - 类型后边加？，代表可以是空，但是赋值给widget时候有必须是确定值的，
    - model 中怎么使用？
    
因flutter2.0添加了Sound null safety空安全声明，目的是通过显式声明可能为null的变量，增加Dart语言的鲁棒性。

因为Dart语言变量可以存null或者具体的值，因此在日常的开发中可能因为忘记赋值或者变量延迟赋值，导致访问某个变量时为null，导致程序运行时抛出exception。
这个功能推出后，可以从源码级解决null异常导致的错误。
简单的操作是在类型声明后添加？以标识这个变量是可以为null的。

