import 'dart:convert';

import 'package:http/http.dart' as http;

import '../newsModel.dart';

class Api {
  Future<NewsDataModel?> newsPostData() async {
    http.Response response = await http.post(
      Uri.parse("https://api.freefantasy.in/tips/getNewsList?offset=0&limit=4"),
    );
    //log("message========>${jsonDecode(response.body)}");
    NewsDataModel? newsDataModel;
    if (jsonDecode(response.body)["status"] == true) {
      return newsDataModel = NewsDataModel.fromJson(jsonDecode(response.body));
    } else {
      print("=====");
    }

    return newsDataModel;
  }
}
