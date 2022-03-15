import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/completed_matches_modal.dart';

class CompletedMatchApi {
  static var url = "https://api.freefantasy.in/tips/getMatches";

  static Map<String, String> header = {
    "Content-Type": 'text/plain',
  };

  static Future<CompletedMatches?> fetchCompletedMatchesData() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'matchStatus': '4', 'offset': '0', 'limit': '20'});

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      print("CompletedMatches=====>>>>>>>${data}");
      if (response.statusCode == 200) {
        return CompletedMatches.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      print("service==>>>$e");
    }
    return null;
  }
}
