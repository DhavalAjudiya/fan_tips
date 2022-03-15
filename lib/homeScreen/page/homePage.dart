import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package
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
                                CustomeText(
                                  title: AppString.zimbabweVsAfghanistan,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                ),
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
                                                  "assets/image/zim.png"),
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
                                                  "assets/image/afglogo.svg"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: CustomeText(
                  title: AppString.featuredExperts,
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
                            left: 10.sp,
                            right: 10.sp,
                            top: 12.sp,
                            bottom: 8.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18.sp,
                                  child: Image.asset("assets/image/t20.png"),
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
                                                  "assets/image/youtubee.png",
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
                                const Icon(
                                  Icons.favorite_outline,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CustomeText(
                                          title: "72",
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
                                          title: "429",
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
                                          title: "13",
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
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  children: [
                    CustomeText(
                      title: AppString.topStories,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(NewsScreen.routeName);
                      },
                      child: Row(
                        children: [
                          CustomeText(
                            title: AppString.viewAll,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10.sp,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 10.sp, right: 10.sp, top: 8.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppContainer(
                            onTap: () {
                              Get.toNamed(NewsDetailedScreen.routeName,
                                  arguments: {
                                    "image": homeController
                                        .newsModel.value.news?[index].image,
                                    "title": homeController
                                        .newsModel.value.news?[index].title,
                                    "subtitle": homeController
                                        .newsModel.value.news?[index].smallDesc,
                                    "time": homeController.timeAgo(
                                        homeController.data(homeController
                                            .newsModel
                                            .value
                                            .news?[index]
                                            .time)),
                                  });
                            },
                            height: 20.h,
                            borderRadius: BorderRadius.circular(10.sp),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${homeController.newsModel.value.news?[index].image}"),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomeText(
                            title:
                                "${homeController.newsModel.value.news?[index].title}",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomeText(
                            title:
                                "${homeController.newsModel.value.news?[index].smallDesc}",
                            fontSize: 10.sp,
                            color: AppColor.whiteColor.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomeText(
                            title:
                                "${homeController.newsModel.value.news?[index].newsSource}",
                            fontSize: 8.sp,
                            color: AppColor.whiteColor.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomeText(
                            title: homeController.timeAgo(homeController.data(
                                homeController
                                    .newsModel.value.news?[index].time)),
                            fontSize: 8.sp,
                            color: AppColor.whiteColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
