import 'dart:convert';
import 'dart:developer';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:http/http.dart' as http;
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
}
