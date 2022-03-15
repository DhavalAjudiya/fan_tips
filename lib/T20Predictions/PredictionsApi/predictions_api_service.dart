import 'dart:convert';
import 'dart:developer';
import 'package:fantips/T20Predictions/PredictionsApi/predictions_modal.dart';
import 'package:http/http.dart' as http;

class PredictionsApiService {
  static var url = "https://api.freefantasy.in/tips/getMatches";

  static Map<String, String> header = {
    "Content-Type": 'text/plain',
  };

  static Future<PredictionModal?> matchesData() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'matchStatus': '4', 'offset': '0', 'limit': '20'});
      log("aaaa");

      http.StreamedResponse response = await request.send();
      log("ddd");
      final data = await response.stream.bytesToString();
      log("bbbb");
      if (response.statusCode == 200) {
        log("cccc");
        print("response=====>>>>>>>$data");
        return PredictionModal.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      print("service==>>>$e");
    }
    return null;
  }
}
