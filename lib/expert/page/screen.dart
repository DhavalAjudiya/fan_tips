import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/commanText.dart';
import '../../utills/asset.dart';
import '../../utills/color.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import 'prediction_container.dart';
import '../data/controller.dart';

class ExpertScreen extends StatelessWidget {
  static const routeName = "/ExpertScreen";
  IplController iplController = Get.put(IplController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColorBlack,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppString.predictionExperts,
                    style: TextStyle(
                      fontFamily: 'circular',
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.w),
                            topLeft: Radius.circular(6.w),
                          ),
                        ),
                        context: context,
                        builder: (context) => SizedBox(
                          child: Column(
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
                                    const CustomeText(
                                        title: AppString.letsconnect),
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
                                height: 5.h,
                              ),
                              Flexible(
                                child: AppContainer(
                                  onTap: () {},
                                  child: Row(
                                    children: const [],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      AppString.logIn,
                      style: TextStyle(
                        fontFamily: 'circular',
                        color: AppColor.green,
                        fontSize: 13.2.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    "assets/icons/search.svg",
                    height: 2.3.h,
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColor.containerBackgroundColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 28.h,
                        decoration: const BoxDecoration(
                          color: AppColor.containerBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 0.2.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Container(
                                        height: 0.2.h,
                                        width: 3.5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Container(
                                        height: 0.2.h,
                                        width: 2.5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    AppString.sortBy,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'circular',
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              const Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.predictions,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              const Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.averageScore,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              const Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.wins,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 5.8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.containerBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 0.2.h,
                              width: 6.w,
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(
                              height: 0.3.h,
                            ),
                            Container(
                              height: 0.2.h,
                              width: 4.5.w,
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(
                              height: 0.3.h,
                            ),
                            Container(
                              height: 0.2.h,
                              width: 2.5.w,
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        AppString.sortByAvgScore,
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontFamily: 'circular',
                          color: AppColor.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.green,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(
                () => Flexible(
                  child: SizedBox(
                    height: 79.h,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          iplController.expert.value.tipsters?.length ?? 0,
                      itemBuilder: (context, index) {
                        var postData =
                            iplController.expert.value.tipsters![index];
                        return Obx(
                          () => PredictionContainer(
                            predictionCount: "${postData.totalPredictions}",
                            onPressed: () {
                              if (postData.wishlist.value == false) {
                                postData.wishlist.value = true;
                              } else {
                                postData.wishlist.value = false;
                              }
                            },
                            icon: postData.wishlist.value == false
                                ? const Icon(Icons.favorite_border,
                                    color: AppColor.green)
                                : const Icon(Icons.favorite,
                                    color: AppColor.green),
                            winsCount: "${postData.top3}",
                            youtubeText: "${postData.subscriberCount}",
                            averageCount: "${postData.avgScore}",
                            headerText:
                                '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                            backgroundImage: NetworkImage(postData.profileUrl ??
                                "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png"),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
