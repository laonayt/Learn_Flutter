class BannerModel {
  String desc = '';
  int id = 0;
  String imagePath = '';
  int isVisible = 0;
  int order = 0;
  String title = '';
  int type = 0;
  String url = '';

  BannerModel.fromJson(Map data) {
    desc = data['desc'];
    id = data['id'];
    imagePath = data['imagePath'];
    isVisible = data['isVisible'];
    order = data['order'];
    title = data['title'];
    type = data['type'];
    url = data['url'];
  }
}
