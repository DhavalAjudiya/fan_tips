import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'pageView/page_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final spinkit = const SpinKitThreeBounce(
    color: Colors.white,
  );

  @override
  void onInit() {
    splashScreen();
    AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.onInit();
  }

  Future splashScreen() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Get.offNamed(PageViewScreen.routeName);
  }
}
