import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'api_service.dart';
import 'model.dart';

class IpController extends GetxController {
  Rx<Expert> expert = Expert().obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxInt index = 0.obs;
  bool isBottomSelect = false;

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxBool isLoggedIn = false.obs;
  UserCredential? userObj;
  RxMap fbData = {}.obs;

  RxList searchItem = [].obs;
  RxBool isLoading = true.obs;
  RxList expertData = [].obs;
  int count = 0;
  bool pageAvailable = true;

  dataPost() async {
    try {
      isLoading.value = true;
      final result = await MatchApiService().data(0);
      expert.value = result!;
      if (expert.value.tipsters!.isNotEmpty) {
        expertData.addAll(expert.value.tipsters!);
        log("=======-=-==-=-=-=-=>fnjsddkvsdb${expertData.length}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  paginationData() async {
    if (!pageAvailable) {
      print('No More Products');
      return;
    }
    try {
      isLoading.value = true;
      if (expert.value.tipsters!.length > 20) {
        pageAvailable = false;
      } else {
        count++;
        log("==========>>>${count}");
      }
      final result = await MatchApiService().data(count);
      expert.value = result!;
      if (expert.value.tipsters!.isNotEmpty) {
        expertData.addAll(expert.value.tipsters!);
        log("=======-=-==-=-=-=-=>${expertData.length}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    dataPost();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        log("${scrollController.position.pixels}");
        paginationData();
      }
    });
    super.onInit();
  }
}
