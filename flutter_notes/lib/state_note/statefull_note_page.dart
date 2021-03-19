import 'package:flutter/material.dart';

class StatefullNotePage extends StatefulWidget {
  final String nameStr;
  StatefullNotePage(this.nameStr);

  @override
  _StatefullNotePageState createState() => _StatefullNotePageState();
}

class _StatefullNotePageState extends State<StatefullNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameStr),//和stateless的区别
      ),
      body: Container(),
    );
  }
}
