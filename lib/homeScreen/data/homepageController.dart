import 'dart:developer';
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
  RxBool isLoading = true.obs;

  RxBool selected = false.obs;
  RxBool notificationsItem = false.obs;
  PageController pageController = PageController(initialPage: 0);
  RefreshController refreshNewsController =
      RefreshController(initialRefresh: false);
  Rx<NewsDataModel> newsModel = NewsDataModel().obs;
  RxList newsPagination = [].obs;
  int pageLimit = 20;
  int count = 0;
  bool pageAvailable = true;
  ScrollController scrollController = ScrollController();

  Rx<Expert> predictionsData = Expert().obs;
  RxList<Tipster> wishListItems = <Tipster>[].obs;

  @override
  void onInit() {
    callMethod(0);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        log("${scrollController.position.pixels}");
        loadMoreData();
      }
    });

    expertMethod();
    super.onInit();
  }

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

  callMethod(int count) async {
    try {
      isLoading.value = true;
      final result = await ApiService().newsPostData(0);
      newsModel.value = result!;
      if (newsModel.value.news!.isNotEmpty) {
        newsPagination.addAll(newsModel.value.news!);
      }
    } finally {
      isLoading.value = false;
    }
  }

  loadMoreData() async {
    if (!pageAvailable) {
      print('No More Products');
      return;
    }
    try {
      isLoading.value = true;
      if (newsModel.value.news!.length > pageLimit) {
        pageAvailable = false;
      } else {
        count++;

        log("===========>${count.obs}");
      }

      var result = await ApiService().newsPostData(count);
      newsModel.value = result!;
      if (newsModel.value.news!.isNotEmpty) {
        newsPagination.addAll(newsModel.value.news!);
        log("++++++++${newsPagination.length}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  expertMethod() async {
    try {
      final result = await ApiService().expertData();
      predictionsData.value = result!;
      return predictionsData;
    } catch (e, st) {
      print('-->>${e} -->>${st}');
    }
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
}
