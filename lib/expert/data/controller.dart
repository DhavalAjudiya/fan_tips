import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'api_service.dart';
import 'model.dart';

class IplController extends GetxController {
  Rx<Expert> expert = Expert().obs;
  // RxList<Tipster> data = <Tipster>[].obs;

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
