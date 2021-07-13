// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
  Photo({
    this.postid,
    this.desc,
    this.pvnum,
    this.createdate,
    this.scover,
    this.setname,
    this.cover,
    this.pics,
    this.clientcover1,
    this.replynum,
    this.topicname,
    this.setid,
    this.seturl,
    this.datetime,
    this.clientcover,
    this.imgsum,
    this.tcover,
  });

  String postid;
  String desc;
  String pvnum;
  DateTime createdate;
  String scover;
  String setname;
  String cover;
  List<dynamic> pics;
  String clientcover1;
  String replynum;
  String topicname;
  String setid;
  String seturl;
  DateTime datetime;
  String clientcover;
  String imgsum;
  String tcover;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    postid: json["postid"],
    desc: json["desc"],
    pvnum: json["pvnum"],
    createdate: DateTime.parse(json["createdate"]),
    scover: json["scover"],
    setname: json["setname"],
    cover: json["cover"],
    pics: List<dynamic>.from(json["pics"].map((x) => x)),
    clientcover1: json["clientcover1"],
    replynum: json["replynum"],
    topicname: json["topicname"],
    setid: json["setid"],
    seturl: json["seturl"],
    datetime: DateTime.parse(json["datetime"]),
    clientcover: json["clientcover"],
    imgsum: json["imgsum"],
    tcover: json["tcover"],
  );

  Map<String, dynamic> toJson() => {
    "postid": postid,
    "desc": desc,
    "pvnum": pvnum,
    "createdate": createdate.toIso8601String(),
    "scover": scover,
    "setname": setname,
    "cover": cover,
    "pics": List<dynamic>.from(pics.map((x) => x)),
    "clientcover1": clientcover1,
    "replynum": replynum,
    "topicname": topicname,
    "setid": setid,
    "seturl": seturl,
    "datetime": datetime.toIso8601String(),
    "clientcover": clientcover,
    "imgsum": imgsum,
    "tcover": tcover,
  };
}
