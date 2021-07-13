
class HomeItemModel {
  String title;
  String des;

  HomeItemModel.fromJson(Map map) {
    title = map["title"];
    des = map["des"];
  }

  HomeItemModel({this.title, this.des});

}