class ArticleModel {
  String title = '';
  String author = '';
  String chapterName = '';
  String niceShareDate = '';
  String link = '';

  ArticleModel.fromJson(Map data) {
    title = data['title'];
    author = data['author'];
    chapterName = data['chapterName'];
    niceShareDate = data['niceShareDate'];
    link = data['link'];
  }
}
