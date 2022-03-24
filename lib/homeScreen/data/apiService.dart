import 'dart:convert';
import 'dart:developer';
import 'package:fantips/expert/data/model.dart';
import 'package:http/http.dart' as http;
import '../../utills/string.dart';
import 'newsModel.dart';

class ApiService {
  Future<NewsDataModel?> newsPostData(int count) async {
    http.Response response = await http.post(
      Uri.parse(
          "https://api.freefantasy.in/tips/getNewsList?offset=$count&limit=20"),
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

  Future<Expert?> expertData(int count) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://api.freefantasy.in/tips/tipsters?offset=$count&limit=20"),
        headers: {"Content-Type": "text/plain"});

    log("expert========>${jsonDecode(response.body)}");
    Expert? expert;
    if (response.statusCode == 200) {
      return expert = Expert.fromJson(jsonDecode(response.body));
    } else {
      print("=====");
    }

    return expert;
  }
}
