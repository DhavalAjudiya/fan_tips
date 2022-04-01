import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../data/model.dart';

class ExpertApiService {
  // static final ExpertApiService _expertRepository = ExpertApiService();
  // static const int _perPage = 10;
  // factory ExpertApiService() {
  //   return _expertRepository;
  // }
  Future<Expert> data(String sdata) async {
    Map<String, dynamic> body = {"name": sdata};
    final data = await http.post(
      Uri.parse("https://api.freefantasy.in/tips/tipsters"),
      body: jsonEncode(body),
      headers: {"Content-Type": "text/plain"},
    );

    return expertFromJson(data.body);
  }
}
