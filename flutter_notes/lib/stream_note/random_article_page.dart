import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

class RandomArticle extends StatefulWidget {
  @override
  _RandomArticleState createState() => _RandomArticleState();
}

class _RandomArticleState extends State<RandomArticle> {
  static Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://interface.meiriyiwen.com'),
  );

  static Future<Map> _getArticle() async {
    Response response = await _dio.get(
      '/article/random',
      queryParameters: {"dev": 1},
    );

    final data = response.data['data'];
    return data;
  }

  Stream<Map> _futuresStream;

  @override
  void initState() {
    List<Future<Map>> futures = [];
    for (int i = 0; i < 10; i++) {
      // 添加 Future
      futures.add(_getArticle());
    }

    // 生成 Stream
    _futuresStream = Stream<Map>.fromFutures(futures);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(title: Text('Random Article')),
      body: SingleChildScrollView(
        child: Center(
          child: StreamBuilder<Map>(
            stream: _futuresStream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Map article = snapshot.data;

                return Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 24.0),
                      Text(
                        article['title'],
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          left: 12.0,
                          right: 12.0,
                          bottom: 60.0,
                        ),
                        child: Container(
                          // child: Html(
                          //   data: article['content'],
                          // ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}