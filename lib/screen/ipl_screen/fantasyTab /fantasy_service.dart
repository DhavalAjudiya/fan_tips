import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'fantasy_model.dart';

class ApiFantasyService {
  static Future<FantasyModel?> fantasy(String value) async {
    try {
      final url =
          Uri.parse("https://api.freefantasy.in/tips/tipsters?name?=$value");
      var response = await http.post(
        url,
        body: jsonEncode({
          "name": value,
        }),
      );
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log(response.body);
        final FantasyModel fantasyModel =
            FantasyModel.fromJson(jsonDecode(response.body));
        print("cricekModel-=-=-=-=-=-=-${fantasyModel.tipsters?.length}");

        return fantasyModel;
      }
    } catch (e) {
      print("--------$e");
    }
  }
}
