import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/ipl_screen/fantasyTabBar/modelService/fantasy_model.dart';
import '../../screen/ipl_screen/fantasyTabBar/modelService/fantasy_service.dart';
import '../../utills/string.dart';

// ignore: deprecated_member_use
class IplController extends GetxController with SingleGetTickerProviderMixin {
  /// fantasy tab
  TextEditingController controller = TextEditingController();
  RxInt select = 0.obs;
  bool isSelect = false;
  RxBool isLoggedIn = false.obs;
  RxList<String> titleScore =
      <String>["Prediction", "Average Score", "Wins"].obs;
  RxInt index = 0.obs;

  // RxBool isLoggedIn = false.obs;
  RxString selectedBottomSheetText = "".obs;
  ApiFantasyService services = ApiFantasyService();
  Rx<FantasyModel> service = FantasyModel().obs;
  int count = 0;
  RxList data = [].obs;
  RxBool isLoading = true.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchData(0);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nextData();
      }
    });
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController1 = TabController(length: upcoming.length, vsync: this);
    isOn();
  }

  fetchData(int count) async {
    try {
      isLoading.value = true;
      final result = await ApiFantasyService.fantasy(0);
      service.value = result!;
      if (service.value.tipsters!.isNotEmpty) {
        data.addAll(service.value.tipsters!);
      }
    } finally {
      isLoading.value = false;
    }
  }

  nextData() async {
    try {
      isLoading.value = true;
      count++;
      final result = await ApiFantasyService.fantasy(count);
      service.value = result!;
      if (service.value.tipsters!.isNotEmpty) {
        data.addAll(service.value.tipsters!);
      }
    } finally {
      isLoading.value = false;
    }
  }

  ///

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
}
