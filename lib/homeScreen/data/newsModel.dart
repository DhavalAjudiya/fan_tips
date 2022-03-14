// To parse this JSON data, do
//
//     final newsDataModel = newsDataModelFromJson(jsonString);

import 'dart:convert';

NewsDataModel newsDataModelFromJson(String str) =>
    NewsDataModel.fromJson(json.decode(str));

String newsDataModelToJson(NewsDataModel data) => json.encode(data.toJson());

class NewsDataModel {
  NewsDataModel({
    this.news,
    this.result,
    this.status,
  });

  List<News>? news;
  String? result;
  bool? status;

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
        result: json["result"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news!.map((x) => x.toJson())),
        "result": result,
        "status": status,
      };
}

class News {
  News({
    this.smallDesc,
    this.image,
    this.newsSource,
    this.id,
    this.time,
    this.title,
    this.newsType,
  });

  String? smallDesc;
  String? image;
  String? newsSource;
  int? id;
  int? time;
  String? title;
  String? newsType;

  factory News.fromJson(Map<String, dynamic> json) => News(
        smallDesc: json["smallDesc"],
        image: json["image"],
        newsSource: json["newsSource"],
        id: json["id"],
        time: json["time"],
        title: json["title"],
        newsType: json["newsType"],
      );

  Map<String, dynamic> toJson() => {
        "smallDesc": smallDesc,
        "image": image,
        "newsSource": newsSource,
        "id": id,
        "time": time,
        "title": title,
        "newsType": newsType,
      };
}
