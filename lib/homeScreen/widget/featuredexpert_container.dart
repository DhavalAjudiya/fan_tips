import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../T20Predictions/page/utills/string.dart';
import '../../commanWidget/commanText.dart';
import '../../widget/custom_container.dart';
import '../data/homepageController.dart';

class FeaturedExpertContainer extends StatelessWidget {
  FeaturedExpertContainer({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
          child: PageView.builder(
            controller: homeController.pageController,
            onPageChanged: (value) {
              homeController.featureSelect.value = value;
            },
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return AppContainer(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColor.blackColor,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, top: 12.sp, bottom: 8.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18.sp,
                            child: Image.asset(AppImage.t20),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                          title: AppString.t20Predictions,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AppImage.youtube,
                                            height: 2.h,
                                            width: 3.w,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          CustomeText(
                                            title: AppString.subscriber,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8.sp,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Obx(
                            () => InkWell(
                              onTap: () {
                                if (homeController.favoriteItem.value ==
                                    false) {
                                  homeController.favoriteItem.value = true;
                                } else {
                                  homeController.favoriteItem.value = false;
                                }
                              },
                              child: homeController.favoriteItem.value == false
                                  ? const Icon(
                                      Icons.favorite_outline,
                                    )
                                  : const Icon(
                                      Icons.favorite_outline,
                                      color: AppColor.greenColor,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomeText(
                                    title: AppString.predic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp),
                                CustomeText(
                                  title: AppString.predictions,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Container(
                              height: 6.h,
                              width: 0.2.w,
                              color: AppColor.verticalDivider,
                            ),
                            Column(
                              children: [
                                CustomeText(
                                    title: AppString.avgNum,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp),
                                CustomeText(
                                  title: AppString.averageScore,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Container(
                              height: 6.h,
                              width: 0.2.w,
                              color: AppColor.verticalDivider,
                            ),
                            Column(
                              children: [
                                CustomeText(
                                    title: AppString.winsNum,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp),
                                CustomeText(
                                  title: AppString.wins,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => AppContainer(
                height: 0.6.h,
                width: 4.w,
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                borderRadius: BorderRadius.circular(8.sp),
                color: homeController.featureSelect.value == index
                    ? AppColor.greenColor
                    : AppColor.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
