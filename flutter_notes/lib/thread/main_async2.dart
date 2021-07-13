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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: createFuture(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("错误❌"),);

            } else {
              List dataList = snapshot.data;
              print(dataList);

              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(dataList[index]),
                  );

                },
              );
            }
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  Future<List<String>> createFuture() async {
    return Future.delayed(Duration(seconds: 2), () => ["我是从互联网上获取的数据"]);
    print("before");
    List list = List.generate(1, (index) {
      return "我是第几个${index}";
    });
    List dataList = [];
    for(int i = 0; i < list.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      print("add one");
      dataList.add(list[i] + "我是后缀");
    }
    print("finish");
    return dataList;
  }
}
