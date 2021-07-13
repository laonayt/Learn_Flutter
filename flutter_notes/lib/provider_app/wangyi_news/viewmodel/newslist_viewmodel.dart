import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/provider_app/wangyi_news/base/base_viewmodel.dart';
import 'package:flutter_notes/provider_app/wangyi_news/mode/newslist_model.dart';

class NewsListViewModel extends BaseViewModel {

  var newsListData = [];

  void requestNewsListData() async {
    Dio dio = Dio();
    var response = await dio.get('http://c.m.163.com/nc/article/headline/T1348647853363/0-40.html');
    // print(response);

    var dataArray = response.data['T1348647853363'];
    for(Map map in dataArray) {
      newsListData.add(NewsListModel.fromJson(map));
    }
  }

}

