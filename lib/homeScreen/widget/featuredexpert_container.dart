import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/prediction.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../commanWidget/commanText.dart';
import '../../utills/string.dart';
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
              return Obx(
                () => AppContainer(
                  onTap: () {
                    Get.toNamed(
                      T20Prediction.routeName,
                      arguments: {
                        "img": homeController.predictionsData.value
                                .tipsters?[index].profileUrl ??
                            "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                        "text": homeController
                            .predictionsData.value.tipsters?[index].name,
                        "prediction": homeController.predictionsData.value
                            .tipsters?[index].totalPredictions,
                        "avgScore": homeController
                            .predictionsData.value.tipsters?[index].avgScore,
                        "win": homeController
                            .predictionsData.value.tipsters?[index].top3,
                        "subscribers": homeController.predictionsData.value
                            .tipsters?[index].subscriberCount,
                      },
                    );
                  },
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
                              backgroundImage: NetworkImage(
                                  "${homeController.predictionsData.value.tipsters?[index].profileUrl}"),
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
                                            title:
                                                "${homeController.predictionsData.value.tipsters?[index].name}",
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
                                              title:
                                                  "${homeController.predictionsData.value.tipsters?[index].subscriberCount}",
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
                                  if (homeController.predictionsData.value
                                          .tipsters?[index].wishlist ==
                                      false) {
                                    homeController.predictionsData.value
                                        .tipsters?[index].wishlist.value = true;
                                    homeController.addProduct(homeController
                                        .predictionsData
                                        .value
                                        .tipsters![index]);
                                  } else {
                                    homeController.removeProduct(homeController
                                        .predictionsData
                                        .value
                                        .tipsters![index]);
                                    homeController
                                        .predictionsData
                                        .value
                                        .tipsters?[index]
                                        .wishlist
                                        .value = false;
                                  }
                                },
                                child: homeController.predictionsData.value
                                            .tipsters?[index].wishlist ==
                                        false
                                    ? const Icon(
                                        Icons.favorite_outline,
                                      )
                                    : const Icon(
                                        Icons.favorite,
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
                                      title:
                                          "${homeController.predictionsData.value.tipsters?[index].totalPredictions}",
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
                                      title:
                                          "${homeController.predictionsData.value.tipsters?[index].avgScore}",
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
                                      title:
                                          "${homeController.predictionsData.value.tipsters?[index].top3}",
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
