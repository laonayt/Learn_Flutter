import 'package:flutter/material.dart';
import 'package:flutter_notes/provider_app/wangyi_news/base/base_view.dart';
import 'package:flutter_notes/provider_app/wangyi_news/viewmodel/newslist_viewmodel.dart';
import 'newslist_cell.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网易新闻'),
      ),
      body: BaseView<NewsListViewModel>(
        viewModel: NewsListViewModel(),
        requestNetWork: (viewModel) => viewModel.requestNewsListData(),
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.newsListData.length,
            itemBuilder: (context,index) => NewsListCell(model: viewModel.newsListData[index],),
          );
        },
      ),
    );
  }
}

/*
* dynamic 和T 的区别
*
* */