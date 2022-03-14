import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../commanWidget/commanText.dart';
import '../../utills/color.dart';
import '../../widget/custom_container.dart';

class NewsDetailedScreen extends StatelessWidget {
  static const routeName = "/NewsDetailedScreen";
  final HomeController homeController = Get.find();
  NewsDetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
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
                    image: NetworkImage(data["image"]),
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
                        title: data["title"],
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomeText(
                        title: data["subtitle"],
                        fontSize: 10.sp,
                        color: AppColor.whiteColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomeText(
                        title: data["time"],
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
