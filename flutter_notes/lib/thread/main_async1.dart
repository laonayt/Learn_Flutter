import 'package:flutter/material.dart';

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
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("initState begin");

    tempAction();

    print("initState end");
  }

  //说明异步只是在合适的时间点把结果插入
  tempAction() async {
    await Future.delayed(Duration(seconds: 5), () {
      print("initState ddd");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            child: Text("Normal"),
            onPressed: btnAction,
        ),
      ],
    );
  }

  btnAction() async {
    //阻塞住了主线程
    // sleep(Duration(minutes: 10));

    /*
    两种写法一样，都会阻塞UI线程,说明仍在UI线程
    * **/
    //1、
    // _count = await  asyncCountEven();
    // setState(() {});

    //2、
    asyncCountEven().then((value) {
      setState(() {});
    });
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

}

/*
* await 它同步执行该方法的代码直到第一个 await 关键字，然后它暂停该方法其他部分的执行；
一旦由 await 关键字引用的 Future 执行完成，下一行代码将立即执行。
* */
