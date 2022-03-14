import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_container.dart';
import '../data/homepageController.dart';
import 'newsDetailedPage.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 10.sp, top: 8.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomeText(
                      title: AppString.fanTips,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                    CustomeText(
                      title: AppString.logIn,
                      color: AppColor.greenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: CustomeText(
                  title: AppString.matchesForYou,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 18.h,
                child: PageView.builder(
                  controller: homeController.pageController,
                  onPageChanged: (value) {
                    homeController.matchSelect.value = value;
                  },
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return AppContainer(
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      borderRadius: BorderRadius.circular(10.sp),
                      color: AppColor.blackColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.sp, right: 10.sp, top: 8.sp, bottom: 8.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // CustomeText(
                                //   title: AppString.zimbabevsAfghhanistan,
                                //   color: AppColor.whiteColor,
                                //   fontWeight: FontWeight.w500,
                                //   fontSize: 10.sp,
                                // ),
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/image/Vector.svg",
                                  color: AppColor.whiteColor,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.sp),
                              child: Row(
                                children: [
                                  AppContainer(
                                    height: 8.h,
                                    width: 60.w,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 9.sp,
                                              backgroundImage: const AssetImage(
                                                  "assets/image/Zim.png"),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            CustomeText(
                                              title: "ZIM",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            const Spacer(),
                                            CustomeText(
                                              title: "110/7",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            CustomeText(
                                              title: "&",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            CustomeText(
                                              title: "110/7",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 9.sp,
                                              child: SvgPicture.asset(
                                                  "assets/image/AFG LOGO.svg"),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            CustomeText(
                                              title: "ZIM",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            const Spacer(),
                                            CustomeText(
                                              title: "110/7",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            CustomeText(
                                              title: "&",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            CustomeText(
                                              title: "110/7",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AppContainer(
                                  height: 9.h,
                                  width: 0.1.w,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            CustomeText(
                              title: "Match Starts in 5:45s",
                              fontSize: 10.sp,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     3,
            //     (index) => Container(
            //       height: 2.h,
            //       width: 2.w,
            //       margin: const EdgeInsets.symmetric(horizontal: 2),
            //       decoration: BoxDecoration(
            //           color: homeController.bannerSelect == index
            //               ? Colors.black.withOpacity(0.5)
            //               : Colors.grey,
            //           shape: BoxShape.circle),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
