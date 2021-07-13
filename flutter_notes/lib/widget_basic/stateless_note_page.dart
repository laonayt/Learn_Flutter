import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class StateLessNotePage extends StatefulWidget {
  final String nameStr;
  StateLessNotePage(this.nameStr);

  @override
  _StateLessNotePageState createState() => _StateLessNotePageState();
}

class _StateLessNotePageState extends State<StateLessNotePage> {
  @override
  Widget build(BuildContext context) {
    print("StateLessNotePage-build");
    var color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameStr),
      ),
      body: Container(
        color: color,
        child: TempView(),
      ),
    );
  }
}

class TempView extends StatefulWidget {
  @override
  _TempViewState createState() => _TempViewState();
}

class _TempViewState extends State<TempView> {
  var _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var timer = Timer.periodic(Duration(seconds: 2), (timer){
      setState(() {
        _count++;
      });
      print("dddd");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TempView-build");

    return Container(
      alignment: Alignment.center,
      child: Text(_count.toString(), style: TextStyle(color: Colors.white, fontSize: 30),),
    );
  }
}
