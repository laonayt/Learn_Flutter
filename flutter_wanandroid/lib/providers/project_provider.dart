import 'dart:io';

import 'package:flutter_wanandroid/models/ArticleModel.dart';
import 'package:flutter_wanandroid/net/http_util.dart';
import 'package:flutter_wanandroid/net/urls.dart';
import 'package:flutter_wanandroid/providers/base_list_provider.dart';

//项目分类
class ProjectCategoryProvider extends BaseListProvider {
  @override
  Future<List> requestData() async {
    var response = await http.get(projectCategories);
    print(response.data);
    throw UnimplementedError();
  }
}

//项目列表
class ProjectListProvider extends BaseListProvider<ArticleModel> {
  @override
  Future<List<ArticleModel>> requestData() async {
    // await Future.delayed(Duration(seconds: 3));

    var pageNum = 0;
    var params = {'cid': 294};
    var response =
        await http.get('article/list/$pageNum/json', queryParameters: params);
    List dataList = response.data['data']['datas'];
    return dataList.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
