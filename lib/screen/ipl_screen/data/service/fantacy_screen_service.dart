import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/fantacy_screen_modal.dart';

class ApiFantasy {
  static Future<CricekModel?> fantacy(String value) async {
    try {
      print("try-----");
      final url =
          Uri.parse("https://api.freefantasy.in/tips/tipsters?name=$value");
      print("try-------111");
      var response = await http.post(
        url,
        body: jsonEncode({
          "name": value,
        }),
      );
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log(response.body);
        final CricekModel cricekModel =
            CricekModel.fromJson(jsonDecode(response.body));
        print("cricekModel-=-=-=-=-=-=-${cricekModel.tipsters?.length}");
        return cricekModel;
      }
    } catch (e) {}
  }
}
