import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../expert/data/model.dart';
import '../../utills/string.dart';
import 'apiService.dart';
import 'newsModel.dart';

class HomeController extends GetxController {
  RxInt matchSelect = 0.obs;
  RxInt featureSelect = 0.obs;

  RxBool selected = false.obs;
  RxBool notificationsItem = false.obs;
  PageController pageController = PageController(initialPage: 0);
  RefreshController refreshNewsController =
      RefreshController(initialRefresh: false);
  Rx<NewsDataModel> newsModel = NewsDataModel().obs;
  Rx<Expert> predictionsData = Expert().obs;
  RxList<Tipster> wishListItems = <Tipster>[].obs;

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
    try {
      final result = await ApiService().newsPostData();
      newsModel.value = result!;
      return newsModel;
    } finally {}
  }

  expertMethod() async {
    try {
      final result = await ApiService().expertData();
      predictionsData.value = result!;
      return predictionsData;
    } finally {}
  }

  void addProduct(Tipster data) {
    print("================1==${data}");
    wishListItems.add(data);
    print("================2==${wishListItems.length}");
  }

  void removeProduct(Tipster data) {
    predictionsData.value.tipsters?.first.wishlist.value = false;

    wishListItems.remove(data);
  }

  Future<void> refreshNews() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    refreshNewsController.refreshCompleted();
  }

  @override
  void onInit() {
    callMethod();
    expertMethod();
    super.onInit();
  }
}
