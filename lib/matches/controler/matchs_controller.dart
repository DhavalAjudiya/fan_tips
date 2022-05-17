import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasources/api_service.dart';
import '../data/datasources/completed_match_data.dart';
import '../data/datasources/live_matches.dart';
import '../data/modal/completed_matches_modal.dart';
import '../data/modal/current_match_modal.dart';
import '../data/modal/live_matches.dart';

class MatchesScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxBool loading = true.obs;
  Rx<CurrentMatch> currentMatch = CurrentMatch().obs;
  Rx<CompletedMatches> completedMatches = CompletedMatches().obs;
  Rx<LiveMatches> liveMatches = LiveMatches().obs;
  RxList<Notstarted> notificationItem = <Notstarted>[].obs;
  RxList data = [].obs;
  ScrollController scrollController = ScrollController();
  int select = 0;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    getData();
    liveMatchesData();
    completedMatchesData(0);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        moreCompletedMatchesData();
      }
    });
  }

  void addNotificationItem(Notstarted data) {
    print("================1==${data}");
    notificationItem.add(data);
    print("================2==${notificationItem.length}");
  }

  void removeNotificationItem(Notstarted data) {
    currentMatch.value.matches?.notstarted?.first.selected.value = false;
    notificationItem.remove(data);
  }

  getData() async {
    try {
      loading.value = true;
      final data = await ApiService.fetchCurrentMatchesData();
      currentMatch.value = data!;
      return currentMatch;
    } finally {
      loading.value = false;
    }
  }

  completedMatchesData(int select) async {
    try {
      loading.value = true;
      final completedData =
          await CompletedMatchApi.fetchCompletedMatchesData(0);

      completedMatches.value = completedData!;
      if (completedMatches.value.matches!.completed!.isNotEmpty) {
        data.addAll(completedMatches.value.matches!.completed!);
      }
      return completedMatches;
    } finally {
      loading.value = false;
    }
  }

  moreCompletedMatchesData() async {
    try {
      loading.value = true;
      select++;
      final completedData =
          await CompletedMatchApi.fetchCompletedMatchesData(select);
      completedMatches.value = completedData!;

      if (completedMatches.value.matches!.completed!.isNotEmpty) {
        data.addAll(completedMatches.value.matches!.completed!);
        print("dataadd${data}");
      }
      return completedMatches;
    } finally {
      loading.value = false;
    }
  }

  liveMatchesData() async {
    try {
      loading.value = true;

      final liveData = await LiveMatchesApi.fetchLiveMatchesData();
      liveMatches.value = liveData!;
      return liveMatches;
    } finally {
      loading.value = false;
    }
  }
}
