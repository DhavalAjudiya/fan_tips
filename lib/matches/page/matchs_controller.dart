// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../data/datasources/api_service.dart';
// import '../data/datasources/current_match_modal.dart';
//
// class HomeScreenContrroler extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   TabController? tabController;
//   Rx<CurrentMatch> currentMatch = CurrentMatch().obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(length: 3, vsync: this);
//     getData();
//   }
//
//   void getData() async {
//     try {
//       var data = await ApiService.fetchCurrentMatchesData();
//
//       if (data != null) {
//         currentMatch.value = data;
//         print(
//             "get--------${currentMatch.value.matches!.notstarted![0].matchName}");
//       }
//     } catch (e) {
//       print("get======== $e");
//     }
//   }
//
//   // String timeAgo(DateTime date) {
//   //   final diff = DateTime.now().difference(date);
//   //
//   //   if (diff.inDays > 365) {
//   //     return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
//   //   }
//   //   if (diff.inDays > 30) {
//   //     return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
//   //   }
//   //   if (diff.inDays > 7) {
//   //     return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
//   //   }
//   //   if (diff.inDays > 0) {
//   //     return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
//   //   }
//   //   if (diff.inHours > 0) {
//   //     return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
//   //   }
//   //   if (diff.inMinutes > 0) {
//   //     return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
//   //   }
//   //   return "just now";
//   // }
//
//   Object timeAgo(DateTime date) {
//     var duration = date.timeZoneOffset;
//     if (duration.isNegative) {
//       return (date.toString() + "    ago");
//     } else {
//       return (date.toString() + "  Ago");
//     }
//   }
//
//   DateTime time(value) {
//     return DateTime.fromMillisecondsSinceEpoch(value);
//   }
// }
