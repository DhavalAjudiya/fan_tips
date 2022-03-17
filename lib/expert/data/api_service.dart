import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class MatchApiService {
  Future<Expert?> data() async {
    final data = await http.post(
      Uri.parse(AppString.matchApiService),
      headers: {"Content-Type": "text/plain"},
    );
    return expertFromJson(data.body);
  }
}
