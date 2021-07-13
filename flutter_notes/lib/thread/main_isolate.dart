import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:isolate';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  static downloadAction(SendPort sendPort1) {
    // print("new isolate create");
    ReceivePort receivePort2 = ReceivePort();
    SendPort sendPort2 = receivePort2.sendPort;

    receivePort2.listen((message) {
      print("sub isolate receive main:${message}");
    });

    sendPort1.send("send1自己给自己发一个消息");
    sendPort1.send([0, sendPort2, "send1把send2发过去,你接一下"]);

    // sendPort2.send("ddd");
    // sleep(Duration(seconds: 2));
    // sendPort2.send("mmm");
    // print("new isolate end");
  }

  static int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    print("in compute");
    return Random().nextInt(256);
    return count;
  }
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Isolates'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_count.toString()),
            ElevatedButton(
              child: Text("Isolate"),
              onPressed: createIsolate,
            ),
            ElevatedButton(
              child: Text("Compute"),
              onPressed: () async {
                _count = await compute(HomePage.countEven, 1000000000);
                print("compute end");
                setState(() {});
              },
            ),
          ],
        )
    );
  }

  createIsolate() async {
    ReceivePort receivePort1 = ReceivePort();
    SendPort sendPort1 = receivePort1.sendPort;

    await Isolate.spawn(HomePage.downloadAction, sendPort1);

    SendPort sendPort2;
    receivePort1.listen((message) {
      print("main isolate receive sub:${message}",);

      if (message[0] == 0) {
        sendPort2 = message[1];
        sendPort2.send("这条信息是send2在main isolate中发的");
      }
    });
  }
}

/*
isolate原理：通过一对ReceivePort（自带一个SendPort）来通信，
使用compute,回调函数必须是静态的,每次调用都相当于新建一个isolate，无法持续调用
* */
