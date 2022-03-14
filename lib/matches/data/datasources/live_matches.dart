import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/live_matches.dart';

class LiveMatchesApi {
  static var url = "https://api.freefantasy.in/tips/getMatches";

  static Map<String, String> header = {
    "Content-Type": 'text/plain',
  };

  static Future<LiveMatches?> fetchLiveMatchesData() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'matchStatus': '1', 'offset': '0', 'limit': '20'});

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      print("LiveMatches=====>>>>>>>${data}");
      if (response.statusCode == 200) {
        return LiveMatches.fromJson(json.decode(data));
      } else {
        return null;
      }
    } catch (e) {
      print("service==>>>$e");
    }
    return null;
  }
}
