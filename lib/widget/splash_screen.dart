import 'package:fantips/utills/asset.dart';
import 'package:fantips/widget/customContainer/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _splashScreenImage(),
        ],
      ),
    );
  }

  Widget _splashScreenImage() {
    return AppContainer(
      height: 23.h,
      image: DecorationImage(
        image: AssetImage(
          ImagesAsset.splashScreen,
        ),
      ),
    );
  }
}
