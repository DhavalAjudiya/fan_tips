import 'dart:developer';
import 'package:fantips/expert/data/model.dart';
import '../networking/expert_block_service.dart';

class ApiRepository {
  // int page = 1;
  // bool isFetching = false;
  //ApiRepository(this.matchRepository);

  static Future<Expert> getExpertList(String sdata) async {
    final response = await ExpertApiService().data(sdata);
    log("response repository  ====${response.tipsters}");
    return response;
  }

  // @override
  // Future<Expert?> getExpertList() async {
  //   final response = await matchRepository.data(page: page);
  //   if (response is http.Response) {
  //     if (response.body == 200) {
  //       final beers = jsonDecode(response.toString());
  //
  //       beers.map((beer) => Expert.fromJson(beer)).toList();
  //
  //       page++;
  //     } else {
  //       response.body;
  //     }
  //   } else if (response is String) {
  //     response;
  //   }
  // }
}
