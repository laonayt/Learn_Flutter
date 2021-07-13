import 'package:flutter/material.dart';
import 'dart:async';

class StreamNotePage extends StatefulWidget {
  @override
  _StreamNotePageState createState() => _StreamNotePageState();
}

class _StreamNotePageState extends State<StreamNotePage> {
  // 创建一个 StreamController
  StreamController<int> _counterStreamController = StreamController<int>(
    onCancel: () {
      print('cancel');
    },
    onListen: () {
      print('listen');
    },
  );

  int _counter = 0;
  Stream _counterStream;
  StreamSink _counterSink;

  @override
  void initState() {
    super.initState();
    _counterSink = _counterStreamController.sink;
    _counterStream = _counterStreamController.stream;
  }

  @override
  void dispose() {
    super.dispose();
    _counterSink.close();
    _counterStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            // 使用 StreamBuilder 显示和更新 UI
            StreamBuilder<int>(
              stream: _counterStream,
              initialData: _counter,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Done',
                    style: Theme.of(context).textTheme.bodyText2,
                  );
                }

                int number = snapshot.data;
                return Text(
                  '$number',
                  style: Theme.of(context).textTheme.bodyText2,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 24.0),
          FloatingActionButton(
            onPressed: _closeStream,
            tooltip: 'Close',
            child: Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  // 使用 StreamSink 向 Stream 发送事件，当 _counter 大于 9 时调用 close 方法关闭流。
  void _incrementCounter() {
    if (_counter > 9) {
      _counterSink.close();
      return;
    }
    _counter++;
    _counterSink.add(_counter);
  }

  // 主动关闭流
  void _closeStream() {
    _counterStreamController.close();
  }

}
