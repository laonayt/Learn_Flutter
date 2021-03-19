import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Text('Flutter调用js'),
            onTap: () {
              _controller
                  .evaluateJavascript('objcCallJsAction()')
                  .then((value) {});
            },
          ),
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: "https://flutterchina.club/",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
            _loadLocalHtml();
          },
          onPageFinished: (url) {},
          //js调用flutter，获取不到flutter的返回值
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "jsCallObjcAction",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                }),
          ].toSet(),
        ),
      ),
    );
  }

  _loadLocalHtml() async {
    var filePath = 'assets/files/example.html';
    var htmlContent = await rootBundle.loadString(filePath);
    _controller.loadUrl(Uri.dataFromString(htmlContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
