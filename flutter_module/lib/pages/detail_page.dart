import 'package:flutter/material.dart';
import 'package:flutter_module/pages/next_page.dart';
import 'package:flutter_module/utils/route_util.dart';
import 'package:flutter_module/utils/screen.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Container(
        color: Colors.cyan,
        width: Screen.width,
        height: Screen.height,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("按钮"),
              onPressed: (){
                pushPage(context, NextPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
