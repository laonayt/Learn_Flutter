import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_module/pages/detail_page.dart';
import 'package:flutter_module/utils/common.dart';
import 'package:flutter_module/utils/route_util.dart';
import 'package:oktoast/oktoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _nameEditController = TextEditingController();
  var _pwdEditController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameEditController.text = "we";
    _pwdEditController.text = "123";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,//水平对齐
          children: [
            SizedBox(height: 150,),
            Text("登录",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 100,),
            TextField(
              controller: _nameEditController,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 32,),
            TextField(
              controller: _pwdEditController,
              decoration: InputDecoration(
                hintText: "请输入密码",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 32,),
            Container(
              width: 100,
              height: 45,
              child: ElevatedButton(onPressed: _loginAction, child: Text("登录")),
            ),
          ],
        ),
      ),
    );
  }

  _loginAction() {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return loadingWidget(title: "登录中...");
        }
    );
    
    // Future.delayed(Duration(seconds: 30),(){});
    sleep(Duration(seconds: 60));

    Navigator.of(context).pop();

    if(_nameEditController.text == "we" && _pwdEditController.text == "123") {
      showToast("登录成功");
      pushPage(context, DetailPage());
    }
  }

}
