import 'package:dio/dio.dart';
import 'http_base.dart';

//对外暴露一个HttpUtil实例
final HttpUtil http = HttpUtil();

class HttpUtil extends HttpBase {
  @override
  void init() {
    options.baseUrl = 'https://www.wanandroid.com/';
  }
}
