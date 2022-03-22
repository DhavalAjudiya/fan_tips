import 'dart:convert';
import 'dart:developer';
import 'package:fantips/expert/data/model.dart';
import 'package:http/http.dart' as http;
import '../../utills/string.dart';
import 'newsModel.dart';

class ApiService {
  Future<NewsDataModel?> newsPostData() async {
    http.Response response = await http.post(
      Uri.parse(AppString.newsDataModel),
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

  Future<Expert?> expertData() async {
    http.Response response = await http.post(
        Uri.parse(AppString.matchApiService),
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
