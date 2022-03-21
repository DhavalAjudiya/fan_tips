import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utills/string.dart';

// ignore: deprecated_member_use
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

  var service;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }
}