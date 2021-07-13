import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStream extends StatefulWidget {
  @override
  _BroadcastStreamState createState() => _BroadcastStreamState();
}

class _BroadcastStreamState extends State<BroadcastStream> {
  StreamController<int> _streamController = StreamController<int>.broadcast();
  StreamSubscription _subscription1;
  StreamSubscription _subscription2;
  StreamSubscription _subscription3;

  int _count = 0;
  int _s1 = 0;
  int _s2 = 0;
  int _s3 = 0;

  @override
  void initState() {
    _subscription1 = _streamController.stream.listen((n) {
      setState(() {
        _s1 += 1;
      });
    });

    _subscription2 = _streamController.stream.listen((n) {
      setState(() {
        _s2 += 2;
      });
    });

    _subscription3 = _streamController.stream.listen((n) {
      setState(() {
        _s3 -= 1;
      });
    });

    super.initState();
  }

  void _add() {
    if (_count > 10) {
      // 大于 10 时停止第一个订阅
      _subscription1.cancel();
    }
    _count++;
    _streamController.add(_count);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
    _subscription1.cancel();
    _subscription2.cancel();
    _subscription3.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broadcast Stream'),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Count: $_count'),
            SizedBox(height: 12.0),
            Text('S1: $_s1'),
            SizedBox(height: 12.0),
            Text('S2: $_s2'),
            SizedBox(height: 12.0),
            Text('S3: $_s3'),
            SizedBox(height: 12.0),
            FloatingActionButton(
              onPressed: _add,
              child: Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}