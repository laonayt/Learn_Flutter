import 'dart:math';
import 'package:flutter/material.dart';

class KeyStateLessView extends StatelessWidget {
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: randomColor,
      child: Text("StateLessView"),
    );
  }
}

class KeyStateFullView extends StatefulWidget {
  KeyStateFullView({Key key}): super(key: key);

  @override
  _KeyStateFullViewState createState() => _KeyStateFullViewState();
}

class _KeyStateFullViewState extends State<KeyStateFullView> {
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: randomColor,
      child: Text("StateLessView"),
    );
  }
}

/*
* 父StateFull， 子StateFull，父刷新子不刷新
* */
