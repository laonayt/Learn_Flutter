import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

/*
利用compute实现多线程解析
compute的交互函数必须是顶层函数
*/
parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/*
抽象类:
 - 声明的方法子类必须实现
*/
abstract class HttpBase extends DioForNative {
  //构造函数
  HttpBase() {
    //添加自定义拦截器
    interceptors.add(HeaderInterceptor());
    // 自定义 jsonDecodeCallback
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    //调用子类实现的初始化
    init();
  }

  //子类必须重写
  void init();
}

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['version'] = '1.0.0';
    options.headers['platform'] = 'ios';

    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // debugPrint('url: ${response.realUri} --> response: ${response.data}');
    super.onResponse(response, handler);
  }
}
