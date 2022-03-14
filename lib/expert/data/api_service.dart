import 'package:http/http.dart' as http;
import 'model.dart';

class MatchApiService {
  Future<Expert?> data() async {
    final data = await http.post(
      Uri.parse("https://api.freefantasy.in/tips/tipsters"),
      headers: {"Content-Type": "text/plain"},
    );
    return expertFromJson(data.body);
  }
}
