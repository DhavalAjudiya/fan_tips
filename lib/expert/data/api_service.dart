import 'package:http/http.dart' as http;
import '../../utills/string.dart';
import 'model.dart';

class MatchApiService {
  static Future<Expert?> data() async {
    final data = await http.post(
      Uri.parse(AppString.matchApiService),
      headers: {"Content-Type": "text/plain"},
    );
    return expertFromJson(data.body);
  }
}
