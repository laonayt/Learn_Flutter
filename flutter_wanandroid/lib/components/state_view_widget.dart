import 'package:flutter/material.dart';

//加载中
class WELoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "加载中...",
              style: TextStyle(fontSize: 22, color: Colors.purple),
            ),
            SizedBox(
              height: 8,
            ),
            CircularProgressIndicator(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class WEErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("发生错误"),
          SizedBox(
            height: 8,
          ),
          Icon(
            Icons.error,
            size: 35,
          ),
        ],
      ),
    );
  }
}
