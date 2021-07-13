import 'package:flutter/material.dart';
import '../mode/newslist_model.dart';

class NewsListCell extends StatelessWidget {
  final NewsListModel model;
  const NewsListCell({this.model});//可选命名参数
  // NewsListCell(this.model);//匿名必选参数
  // NewsListCell({ @required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: Text(model.title, style: TextStyle(fontSize: 18),),
          ),
          SizedBox(height: 16,),
          Container(
            // height: 50,
            child: Image.network(model.imgsrc),
          ),
        ],
      ),
    );
  }
}
