import 'package:flutter/material.dart';

Widget loadingWidget({String title}) {
  title ??= "加载中...";
  return Container(
    width: 200,
    height: 200,
    child: Column(
      children: [
        CircularProgressIndicator(),
        Text(title,style: TextStyle(color: Colors.grey,fontSize: 16),),
      ],
    ),
  );
}