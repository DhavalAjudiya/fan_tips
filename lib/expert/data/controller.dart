import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'api_service.dart';
import 'model.dart';

class ExpertController extends GetxController {
  Rx<Expert> expert = Expert().obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxList<String> sort = <String>["Prediction", "Average Score", "Wins"].obs;
  RxInt index = 0.obs;
  RxString selectedBottomSheetText = "".obs;

  dataPost() async {
    var result = await MatchApiService().data();
    if (result != null) {
      expert.value = result;
      return result;
    }
  }

  @override
  void onInit() {
    dataPost();
    super.onInit();
  }
}
