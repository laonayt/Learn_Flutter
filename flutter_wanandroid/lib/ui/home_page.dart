import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid/models/BannerModel.dart';
import 'package:flutter_wanandroid/providers/provider_widget.dart';
import 'package:flutter_wanandroid/providers/home_provider.dart';
import 'package:flutter_wanandroid/ui/article_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ProviderWidget<HomeProvider>(
        provider: HomeProvider(),
        onModelReady: (provider) {
          provider.requestNetWorkData();
        },
        builder: (context, provider, child) {
          return Column(
            children: [
              BannerWidget(
                bannerList: provider.bannerList,
              ),
              ArticleListWidget(articleList: provider.articleList),
            ],
          );
        },
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  List<BannerModel> bannerList = [];
  BannerWidget({required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        height: 300,
        child: Swiper(
          itemCount: bannerList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Image.network(bannerList[index].imagePath),
            );
          },
        ));
  }
}
