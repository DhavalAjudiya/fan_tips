import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PredictionsApi/predictions_api_service.dart';
import 'PredictionsApi/predictions_modal.dart';

class PredictionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt selected = 0.obs;
  Rx<PredictionModal> currentMatch = PredictionModal().obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    getData();
  }

  void getData() async {
    log("000");
    try {
      var data = await PredictionsApiService.matchesData();
      log("111");
      if (data != null) {
        currentMatch.value = data;
        log("222");
        print(
            "get--------${currentMatch.value.matches!.notstarted![0].matchName}");
      }
    } catch (e) {
      print("get======== $e");
    }
  }

  // Object timeAgo(DateTime date) {
  //   var duration = date.timeZoneOffset;
  //   if (duration.isNegative) {
  //     return (date.toString() + "    ago");
  //   } else {
  //     return (date.toString() + "  Ago");
  //   }
  // }
  //
  // DateTime time(value) {
  //   return DateTime.fromMillisecondsSinceEpoch(value);
  // }
}
