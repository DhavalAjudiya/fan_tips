import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../T20Predictions/page/utills/string.dart';
import '../../commanWidget/commanText.dart';
import '../../widget/custom_container.dart';
import '../data/homepageController.dart';

class MatchForYouContainer extends StatelessWidget {
  MatchForYouContainer({Key? key}) : super(key: key);
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
                          CustomeText(
                            title: AppString.zimbabweVsAfghanistan,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            AppImage.vector,
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
                                          AppImage.zim,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      CustomeText(
                                        title: AppString.zim,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      const Spacer(),
                                      CustomeText(
                                        title: AppString.scoWik,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.andSing,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.scoWik,
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
                                          AppImage.afglogo,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      CustomeText(
                                        title: AppString.zim,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      const Spacer(),
                                      CustomeText(
                                        title: AppString.scoWik,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.andSing,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.scoWik,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            AppContainer(
                              height: 8.h,
                              width: 0.1.w,
                              color: AppColor.verticalDivider,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomeText(
                                  title: "72",
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.greenColor,
                                  fontSize: 18.sp,
                                ),
                                CustomeText(
                                  title: AppString.predictions,
                                  color: AppColor.greenColor,
                                  fontSize: 12.sp,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      CustomeText(
                        title: AppString.time,
                        fontSize: 10.sp,
                      )
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
                color: homeController.matchSelect.value == index
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
