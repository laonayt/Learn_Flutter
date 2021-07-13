import 'dart:convert';
import 'package:flutter/material.dart';
import 'http_util.dart';
import 'package:http/http.dart' as http;
import 'photo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Http'),
          ),
          body: HttpPage(),
      ),
    );
  }
}

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  List<Photo> _dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    requestData();
  }

  requestData() async {
    _dataList = await _fetchPhotos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试网络"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _dataList.length,
            itemBuilder: (context, index){
              Photo model = _dataList[index];
              return ExpansionTile(
                title: Text(model.setname),
                subtitle: Text(model.desc),
                children: [
                  Image.network(model.cover),
                ],
              );
            },
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          var url = "https://mirrors.dgut.edu.cn/ubuntu-releases/20.04.2.0/ubuntu-20.04.2.0-desktop-amd64.iso";
          // await HttpUtil.getInstance().get("http://www.httpbin.org/get");
          // await HttpUtil.getInstance().get(url);
          requestBig();
        },
      ),
    );
  }

  requestBig() async {
    print("begin");
    var url = Uri.https('mirrors.dgut.edu.cn', '/ubuntu-releases/20.04.2.0/ubuntu-20.04.2.0-desktop-amd64.iso');
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.contentLength);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<Photo>> _fetchPhotos() async {
    var client = http.Client();
    http.Response res = await client.get('https://3g.163.com/photocenter/api/list/0001/00AP0001,3R710001,4T8E0001/30/100.json');
    List list = json.decode(res.body);
    return list.map((item) {
      return Photo.fromJson(item);
    }).toList();
  }

}
