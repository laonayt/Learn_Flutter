import 'dart:math';

import 'package:flutter/material.dart';
import 'key_stateless_view.dart';

class KeyPage extends StatefulWidget {
  final String name = "123";
  @override
  _KeyPageState createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  var dataList = ["a","b","c"];
  final GlobalKey<_KeyPageState> homeKey = GlobalKey();
  final String value = "abc";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key练习"),
      ),
      body: ListView(
        children: dataList.map((name) {
          return KeyStateFullView();
          // return KeyStateFullView(key: ValueKey(name),);
          // return KeyStateFullView(key: ValueKey(Random().nextInt(10000)),);
          // return KeyStateLessView();
        }).toList(),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("点击"),
        onPressed: (){
          setState(() {
            dataList.removeLast();

            // print("${homeKey.currentState.value}");
            // print("${homeKey.currentState.widget.name}");
            // print("${homeKey.currentContext}");

          });
        },
      ),
    );
  }
}
