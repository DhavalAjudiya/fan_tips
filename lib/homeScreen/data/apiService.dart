import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'newsModel.dart';

class ApiService {
  Future<NewsDataModel?> newsPostData() async {
    http.Response response = await http.post(
      Uri.parse(
          "https://api.freefantasy.in/tips/getNewsList?offset=0&limit=20"),
    );
    log("NewsDataModel========>${jsonDecode(response.body)}");
    NewsDataModel? newsDataModel;
    if (jsonDecode(response.body)["status"] == true) {
      return newsDataModel = NewsDataModel.fromJson(jsonDecode(response.body));
    } else {
      print("=====");
    }

    return newsDataModel;
  }
}
