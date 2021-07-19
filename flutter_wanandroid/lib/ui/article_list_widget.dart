import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_wanandroid/models/ArticleModel.dart';

class ArticleListWidget extends StatelessWidget {
  List<ArticleModel> articleList = [];
  ArticleListWidget({required this.articleList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articleList.length,
      itemBuilder: (context, index) =>
          ArticleListCell(articleModel: articleList[index]),
    );
  }
}

class ArticleListCell extends StatelessWidget {
  final ArticleModel articleModel;
  ArticleListCell({required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan, width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(articleModel.title),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(articleModel.chapterName),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(articleModel.niceShareDate),
          ),
        ],
      ),
    );

    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan, width: 1),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Text(articleModel.title),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Text(articleModel.chapterName),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(articleModel.niceShareDate),
            ),
          ],
        ),
      ),
    );
  }
}
