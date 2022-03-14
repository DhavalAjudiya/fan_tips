import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/current_match_modal.dart';

class ApiService {
  static var url = "https://api.freefantasy.in/tips/getMatches";

  static Map<String, String> header = {
    "Content-Type": 'text/plain',
  };

  static Future<CurrentMatch?> fetchCurrentMatchesData() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'matchStatus': '2', 'offset': '0', 'limit': '20'});

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      print("CurrentMatch=====>>>>>>>${data}");
      if (response.statusCode == 200) {
        return CurrentMatch.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      print("service==>>>$e");
    }
    return null;
  }
}
