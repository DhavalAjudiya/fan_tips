import 'dart:convert';

import 'package:fantips/homeScreen/newsModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
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
