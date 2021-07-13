
class NewsListModel {
  String title;
  String imgsrc;
  String lmodify;

  NewsListModel.fromJson(Map data) {
    title = data['title'];
    imgsrc = data['imgsrc'];
    lmodify = data['lmodify'];
  }

}

/*
* {
sourceId: "T1348647853363",
riskLevel: 0,
upTimes: 31457,
lmodify: "2021-07-09 14:14:51",
source: "时代周报",
postid: "GEE43RUR0519APGA",
title: "曾被罚110亿的"私募一哥"徐翔今出狱 妻子:不去接他 ",
mtime: "2021-07-09 13:49:21",
topicid: "00019B3E",
digest: "本文来源：时代周报作者：宁鹏按青岛中院的判决，“私募一哥”徐翔将于2021年7月9日刑满出狱。7月8日晚，有知情人士对时代周报记者表示，徐翔妻子应莹证实了这一消",
boardid: "dy_wemedia_bbs",
imgsrc: "http://cms-bucket.ws.126.net/2021/0709/4ecb4316j00qvxqaw000vc000b3006xc.jpg",
ptime: "2021-07-09 10:02:27",
daynum: "18817",
extraShowFields: "[{"title":"","showDocid":"00019B3E_GEE43RUR0519APGA_1"}]",
votecount: 31457,
docid: "GEE43RUR0519APGA",
url_3w: "",
priority: 100,
downTimes: 171,
url: "",
quality: 80,
commentStatus: 1,
replyCount: 31779,
ltitle: "曾被罚110亿的"私募一哥"徐翔今出狱 妻子:不去接他 ",
subtitle: "",
}
* */