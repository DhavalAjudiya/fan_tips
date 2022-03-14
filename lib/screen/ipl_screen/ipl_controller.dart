import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class IplController extends GetxController with SingleGetTickerProviderMixin {
  RxBool isOn = false.obs;
  final List<Tab> myTabs = [
    const Tab(
      text: 'Squads',
    ),
    const Tab(
      text: 'Matches',
    ),
    const Tab(
      text: 'Point Table',
    )
  ];


  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
