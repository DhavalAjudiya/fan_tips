import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/SplashScreen";
  final SplashController _splashController = SplashController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            child: AppContainer(
              height: 100.h,
              width: double.infinity,
              image: const DecorationImage(
                image: AssetImage(AppImage.splashScreen),
                fit: BoxFit.fill,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _splashController.spinkit,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
