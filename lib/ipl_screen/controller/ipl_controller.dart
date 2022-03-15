import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }

  final List<Tab> upcoming = [
    const Tab(
      text: 'Fantasy',
    ),
    const Tab(
      text: 'Best Picks',
    ),
    const Tab(
      text: 'My Teams',
    ),
    const Tab(
      text: 'Quiz',
    )
  ];

  TabController? tabController1;



// @override
  // void onClose() {
  //   tabController!.dispose();
  //   super.onClose();
  // }
}
