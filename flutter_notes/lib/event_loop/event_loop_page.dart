import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EventLoopPage extends StatefulWidget {
  @override
  _EventLoopPageState createState() => _EventLoopPageState();
}

class _EventLoopPageState extends State<EventLoopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
            child: Text("Future"),
            onPressed: () {//点击事件，网络请求放在eventLoop中
              final myFuture =  Dio().get('https://example.com');
              myFuture.then((response) {
                if (response.statusCode == 200) {
                  print('Success!');
                }
              });

            }
        ),
      ),
    );
  }
}
