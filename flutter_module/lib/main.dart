import 'package:flutter/material.dart';
import 'package:flutter_module/pages/detail_page.dart';
import 'package:flutter_module/pages/login_page.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      backgroundColor: Colors.grey,
      radius: 10.0,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
