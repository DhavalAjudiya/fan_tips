import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../T20Predictions/page/utills/asset.dart';
import '../T20Predictions/page/utills/color.dart';
import '../commanWidget/commanText.dart';
import '../expert/data/controller.dart';
import '../screen/ipl_screen/widget/fantasyTabBar/wight/container/container_custom.dart';
import '../utills/string.dart';
import 'google_sign_in_repo.dart';

class AppBottomSheet {
  final IpController ipController = Get.find();
  // final data = ipController.isLoggedIn.value;

  bottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.w),
          topLeft: Radius.circular(6.w),
        ),
      ),
      context: context,
      builder: (context) => Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.clear,
                  size: 9.w,
                ),
                splashColor: AppColor.transparent,
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
          Image.asset(AppImage.logo, height: 40.w),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Row(
              children: [
                Container(
                  height: 0.2.h,
                  width: 27.w,
                  color: AppColor.grey,
                ),
                SizedBox(
                  width: 2.w,
                ),
                CustomeText(title: AppString.letsconnect),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 0.2.h,
                  width: 27.w,
                  color: AppColor.grey,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          AppContainer(
            height: 6.h,
            width: 60.w,
            color: AppColor.containerBackground,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              signInWithGoogle().then(
                (data) {
                  ipController.isLoggedIn.value = true;
                  ipController.userObj = data;
                },
              ).catchError(
                (e) {},
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppImage.google, height: 8.w),
                const CustomeText(
                  title: AppString.googleSign,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          AppContainer(
            height: 6.h,
            width: 60.w,
            color: AppColor.containerBackground,
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppImage.fb, height: 8.w),
                const CustomeText(
                  title: AppString.fbLogin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
