import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
* https://blog.csdn.net/email_jade/article/details/88941434
* flutter入门之理解Isolate及compute
*
* https://cloud.tencent.com/developer/article/1676442
* Flutter/Dart中的异步编程之Isolate
* */

class IsolateNotePage extends StatefulWidget {
  @override
  _IsolateNotePageState createState() => _IsolateNotePageState();
}

class _IsolateNotePageState extends State<IsolateNotePage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: CircularProgressIndicator(),
            ),
            Text(_count.toString()),
            ElevatedButton(
              child: Text("Normal"),
              onPressed: () async {
                //阻塞住了主线程
                // sleep(Duration(minutes: 10));

                /*
                两种写法一样，都会阻塞UI线程,说明仍在UI线程
                * */
                // _count = await  asyncCountEven();
                // setState(() {});
                // asyncCountEven().then((value) {
                //   _count = value;
                //   setState(() {});
                // });
              }
            ),
            ElevatedButton(
              child: Text("Compute"),
              onPressed: () async {
                /*
                * 使用compute,每次调用都相当于新建一个isolate，无法持续调用
                * */
                _count = await compute(countEven, 10000);
                setState(() {});

                print("123");
              },
            ),
            ElevatedButton(
              child: Text("Isolate"),
              onPressed: () {
                createIsolate();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<int> asyncCountEven() async {
    int num = 1000000000;
    int count = 0;
    while (num > 0) {
      if (count % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  static int countEven(int num) {
    // int num = 1000000000;
    int count = 0;
    while (num > 0) {
      if (count % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  createIsolate() async {
    ReceivePort receivePort1 = ReceivePort();
    SendPort sendPort1 = receivePort1.sendPort;

    await Isolate.spawn(downloadAction, sendPort1);

    SendPort sendPort2;
    receivePort1.listen((message) {
      print(
        "main isolate receive sub:${message}",
      );
      if (message[0] == 0) {
        sendPort2 = message[1];
        sendPort2.send("这条信息是send2在main isolate中发的");
      }
    });
  }

  /*
  isolate原理：通过一对ReceivePort（自带一个SendPort）来通信，
  * */
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
}
