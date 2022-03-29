import 'package:http/http.dart' as http;
import 'model.dart';

class MatchApiService {
  Future<Expert?> data(int count) async {
    final data = await http.post(
      Uri.parse(
          "https://api.freefantasy.in/tips/tipsters?offset=$count&limit=20"),
      headers: {"Content-Type": "text/plain"},
    );
    return expertFromJson(data.body);
  }
}
