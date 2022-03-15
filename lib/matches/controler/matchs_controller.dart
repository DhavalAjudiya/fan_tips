import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasources/api_service.dart';
import '../data/datasources/completed_match_data.dart';
import '../data/datasources/live_matches.dart';
import '../data/modal/completed_matches_modal.dart';
import '../data/modal/current_match_modal.dart';
import '../data/modal/live_matches.dart';

class MatchsScreenControoler extends GetxController
    with GetSingleTickerProviderStateMixin {


  TabController? tabController;
  RxBool loading = true.obs;
  Rx<CurrentMatch> currentMatch = CurrentMatch().obs;
  Rx<CompletedMatches> completedMatches = CompletedMatches().obs;
  Rx<LiveMatches> liveMatches = LiveMatches().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    getData();
    liveMatchesData();
    completedMatchesData();
  }

  void getData() async {
    try {
      loading(true);
      var data = await ApiService.fetchCurrentMatchesData();

      if (data != null) {
        currentMatch.value = data;
      }
      loading = false.obs;
    } finally {
      loading(false);
    }
  }

  void completedMatchesData() async {
    try {
      loading(true);
      var completedData = await CompletedMatchApi.fetchCompletedMatchesData();

      if (completedData != null) {
        completedMatches.value = completedData;
      }
    } finally {
      loading(false);
    }
  }

  void liveMatchesData() async {
    try {
      var liveData = await LiveMatchesApi.fetchLiveMatchesData();

      if (liveData != null) {
        liveMatches.value = liveData;
      }
    } catch (e) {
      print("get======== $e");
    }
  }

  String timeAgo(int milliSecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecond);
    final diff = DateTime.now().difference(date);

    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  // Object timeAgo(DateTime date) {
  //   var duration = date.timeZoneOffset;
  //   if (duration.isNegative) {
  //     return (date.toString() + "    ago");
  //   } else {
  //     return (date.toString() + "  Ago");
  //   }
  // }

  DateTime time(value) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }
}
