import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utills/string.dart';

class IplController extends GetxController with SingleGetTickerProviderMixin {


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
      text: AppString.bestPicks,
    ),
    const Tab(
      text: AppString.myTeams,
    ),
    const Tab(
      text: AppString.quiz,
    )
  ];

  TabController? tabController;
  TabController? tabController1;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }
}