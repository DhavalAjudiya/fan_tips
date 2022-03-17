import 'package:fantips/screen/ipl_screen/data/model/fantacy_screen_modal.dart';
import 'package:fantips/screen/ipl_screen/data/service/fantacy_screen_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utills/string.dart';

class IplController extends GetxController with SingleGetTickerProviderMixin {
  /// fantasy screen
  TextEditingController controller = TextEditingController();
  RxInt select = 0.obs;
  bool isSelect = false;
  RxList<String> titleScore =
      <String>["Prediction", "Average Score", "Wins"].obs;
  RxInt index = 0.obs;
  RxString selectedBottomSheetText = "".obs;
  ApiFantasy services = ApiFantasy();
  Rx<CricekModel> service = CricekModel().obs;

  fetchProducts({required String value}) async {
    try {
      service.value = (await ApiFantasy.fantacy(value))!;
    } finally {}
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

  TabController? tabController;

  @override
  void onInit() {
    super.onInit();

    /// fantasy screen api
    fetchProducts(value: controller.text);

    ///
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }

  final List<Tab> upcoming = [
    const Tab(
      text: AppString.fantasyName,
    ),
    const Tab(
      text: AppString.bestPicks,
    ),
    const Tab(
      text: AppString.myTeams,
    ),
    const Tab(
      text: AppString.quiz,
    )
  ];

  TabController? tabController1;

// @override
  // void onClose() {
  //   tabController!.dispose();
  //   super.onClose();
  // }
}
