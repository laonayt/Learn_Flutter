import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil _instance;
  static HttpUtil getInstance() {
    if (_instance == null) {
      _instance = HttpUtil();
    }
    return _instance;
  }

  Dio _dio;

  HttpUtil(){
    BaseOptions options = new BaseOptions(
      followRedirects: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    _dio = Dio(options);

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options){
          print("\n================== 请求数据 ==========================");
          print("url = ${options.uri.toString()}");
          print("headers = ${options.headers}");
          print("params = ${options.data}");
        },
        onResponse: (Response response){
          print("\n================== 响应数据 ==========================");
          print("code = ${response.statusCode}");
          print("data = ${response.data}");
          print("\n");
        },
        onError: (DioError e){
          print("\n================== 错误响应数据 ======================");
          print("type = ${e.type}");
          print("message = ${e.message}");
//            print("stackTrace = ${e.stackTrace}");
          print("\n");
        }
    ));
  }

  formUpload(String url) async {
    var formData;
    formData = FormData.fromMap({
      'name': 'wendux',
      'age': 25,
      'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
    });

    // formData = FormData.fromMap({
    //   'files': [
    //     MultipartFile.fromFileSync('./example/upload.txt', filename: 'upload.txt'),
    //     MultipartFile.fromFileSync('./example/upload.txt', filename: 'upload.txt'),
    //   ]
    // });

    var response = await _dio.post('/info', data: formData);
  }

  get(String url) async {
    BaseOptions options = BaseOptions(
      connectTimeout: 5,
    );
    var response = await _dio.get(url, queryParameters: {}, onReceiveProgress: (int count, int total){
      print("receive:${count},${total}");
    });
    return response;
  }


}