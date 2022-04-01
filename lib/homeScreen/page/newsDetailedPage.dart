import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../commanWidget/commanText.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';

class NewsDetailedScreen extends StatelessWidget {
  static const routeName = "/NewsDetailedScreen";
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppContainer(
                  height: 30.h,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data[AppString.image]),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeText(
                        title: data[AppString.text],
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomeText(
                        title: data[AppString.subtitle],
                        fontSize: 8.sp,
                        color: AppColor.whiteColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomeText(
                        title: data[AppString.timeText],
                        fontSize: 8.sp,
                        color: AppColor.whiteColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
