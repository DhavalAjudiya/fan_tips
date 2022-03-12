import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PredictionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt selected = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }
}
