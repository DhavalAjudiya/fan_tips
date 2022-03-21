import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMatchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt squadSelect = 0.obs;
  RxInt select = 0.obs;
  bool isSelect = false;
  RxInt answerSelect = 0.obs;
  RxInt index = 0.obs;
  RxBool favoriteItem = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
