import 'package:flutter_wanandroid/providers/base_provider.dart';

abstract class BaseListProvider<T> extends BaseProvier {
  //子类实现requestData方法将返回值赋值给这个变量
  List<T> dataList = [];

  //暴露给page的api, 把子类实现的requestData->数据转模型->赋值给dataList
  initData() async {
    viewState = ViewState.busy;
    print('----request');
    dataList = await requestData();
    viewState = ViewState.finish;
    print('----finish');
  }

  //网络请求, provider子类实现，page不能直接调用
  Future<List<T>> requestData();
}
