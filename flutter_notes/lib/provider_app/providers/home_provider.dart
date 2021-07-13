import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes/provider_app/models/home_item_model.dart';

class HomeProvider with ChangeNotifier {
  List<HomeItemModel> dataList = [];
  bool isShowLoading = true;

  HomeProvider(){
    Future.delayed(Duration(seconds: 2), (){
      requestData();
    });
  }

  Future requestData() async {
    var jsonStr = await rootBundle.loadString('assets/json/home.json');

    var list = jsonDecode(jsonStr);

    list.forEach((element) {
      var model = HomeItemModel.fromJson(element);
      dataList.add(model);
    });

    isShowLoading = false;

    notifyListeners();
  }

  addOne() {
    var model = HomeItemModel(title: "添加", des: "这是新的");
    dataList.add(model);
    notifyListeners();
  }
}