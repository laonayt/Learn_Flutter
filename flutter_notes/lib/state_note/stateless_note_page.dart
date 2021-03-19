import 'package:flutter/material.dart';

class StateLessNotePage extends StatelessWidget {
  final String nameStr;
  StateLessNotePage(this.nameStr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameStr),
      ),
      body: Container(),
    );
  }
}
