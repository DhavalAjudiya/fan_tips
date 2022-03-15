import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMatchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  RxInt select = 0.obs;
  bool isSelect = false;
  RxList<String> titleScore =
      <String>["Prediction", "Average Score", "Wins"].obs;
  RxInt index = 0.obs;
  RxString selectedBottomSheetText = "".obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
