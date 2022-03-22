import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/ipl_screen/fantasyTab /fantasy_model.dart';
import '../../screen/ipl_screen/fantasyTab /fantasy_service.dart';
import '../../utills/string.dart';

// ignore: deprecated_member_use
class IplController extends GetxController with SingleGetTickerProviderMixin {
  /// fantasy tab
  TextEditingController controller = TextEditingController();
  RxInt select = 0.obs;
  bool isSelect = false;
  RxList<String> titleScore =
      <String>["Prediction", "Average Score", "Wins"].obs;
  RxInt index = 0.obs;
  RxString selectedBottomSheetText = "".obs;
  ApiFantasyService services = ApiFantasyService();
  Rx<FantasyModel> service = FantasyModel().obs;

  fetchProducts({required String value}) async {
    try {
      service.value = (await ApiFantasyService.fantasy(value))!;
    } catch (e,st) {
      print(e);
    }
  }

  ///

  RxBool isOn = false.obs;
  final List<Tab> myTabs = [
    const Tab(
      text: AppString.squads,
    ),
    const Tab(
      text: AppString.matches,
    ),
    const Tab(
      text: AppString.pointTable,
    )
  ];

  final List<Tab> upcoming = [
    const Tab(
      text: AppString.fantasyName,
    ),
    const Tab(
      text: AppString.commentary,
    ),
    const Tab(
      text: AppString.scoreCard,
    ),
    const Tab(
      text: AppString.quiz,
    )
  ];

  TabController? tabController;
  TabController? tabController1;


  @override
  void onInit() {
    fetchProducts(value: controller.text);
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }
}
