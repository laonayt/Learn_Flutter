import 'package:flutter_wanandroid/models/ArticleModel.dart';
import 'package:flutter_wanandroid/models/BannerModel.dart';
import 'package:flutter_wanandroid/net/http_util.dart';
import 'package:flutter_wanandroid/net/urls.dart';
import 'base_provider.dart';

class HomeProvider extends BaseProvier {
  List<BannerModel> bannerList = [];
  List<ArticleModel> articleList = [];

  requestNetWorkData() async {
    var bannerRes = await http.get(bannerUrl);
    // print(bannerRes.data);
    List bannerArray = bannerRes.data['data'];
    bannerList = bannerArray.map((e) => BannerModel.fromJson(e)).toList();

    var articleRes = await http.get(topArticleUrl);
    List articleArray = articleRes.data['data'];
    articleList = articleArray.map((e) => ArticleModel.fromJson(e)).toList();
    // print(articleRes.data);

    notifyListeners();
  }
}
