import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'apiService.dart';
import 'newsModel.dart';

class HomeController extends GetxController {
  RxInt matchSelect = 0.obs;
  RxInt featureSelect = 0.obs;
  RxBool selected = false.obs;
  PageController pageController = PageController(initialPage: 0);
  Rx<NewsDataModel> newsModel = NewsDataModel().obs;

  String timeAgo(DateTime date) {
    Duration diff = DateTime.now().difference(date);
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
    return AppString.justNow;
  }

  DateTime data(val) {
    return DateTime.fromMillisecondsSinceEpoch(val);
  }

  callMethod() async {
    final result = await ApiService().newsPostData();
    newsModel.value = result!;
    return newsModel;
  }

  @override
  void onInit() {
    callMethod();
    super.onInit();
  }
}
