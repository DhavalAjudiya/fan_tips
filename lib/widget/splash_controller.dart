import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../pageView/page_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final spinkit = SpinKitThreeBounce(
    color: AppColor.white,
    size: 3.h,
  );

  @override
  void onInit() {
    splashScreen();
    AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.onInit();
  }

  Future splashScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Get.offNamed(PageViewScreen.routeName);
  }
}
