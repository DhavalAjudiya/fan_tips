import 'dart:io';

import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/expert/data/controller.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';
import '../../widget/app_bottom_sheet.dart';
import '../../widget/custom_container.dart';
import '../../widget/profile_screen.dart';
import '../data/homepageController.dart';
import '../widget/featuredexpert_container.dart';
import '../widget/matchforyou_container.dart';
import 'newsDetailedPage.dart';
import 'newsScreen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  final HomeController homeController = Get.put(HomeController());
  final IpController ipController = Get.put(IpController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: CustomeText(
              title: AppString.exit,
              fontSize: 15.sp,
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomeText(
                  title: AppString.no,
                  fontSize: 15.sp,
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: CustomeText(
                  title: AppString.yes,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Obx(() {
              return homeController.isLoading.value == true
                  ? Center(
                      child: SpinKitFadingCircle(
                      color: AppColor.white,
                      size: 3.h,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.sp, right: 10.sp, top: 8.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomeText(
                                title: AppString.fanTips,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: () {
                                    ipController.isLoggedIn.value == false
                                        ? AppBottomSheet().bottomSheet(context)
                                        : () {};
                                  },
                                  child: ipController.isLoggedIn.value == false
                                      ? CustomeText(
                                          title: AppString.login,
                                          color: AppColor.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                        )
                                      : Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(ProfileScreen());
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColor.transparent,
                                                radius: 12,
                                                backgroundImage: NetworkImage(
                                                    "${ipController.userObj?.user?.photoURL}"),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Icon(Icons.favorite_outline),
                                          ],
                                        ),
                                ),
                              ),
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
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        MatchForYouContainer(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.sp),
                          child: CustomeText(
                            title: AppString.featuredExperts,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        FeaturedExpertContainer(),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          child: Row(
                            children: [
                              CustomeText(
                                title: AppString.topStories,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
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
                                      fontSize: 8.sp,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 8.sp,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Obx(
                            () => homeController.isLoading.value == true
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 40, top: 10),
                                    child: Center(
                                        child: SpinKitCircle(
                                      color: AppColor.white,
                                      size: 3.h,
                                    )),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => homeController.isLoading.value ==
                                                true
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 40, top: 10),
                                                child: Center(
                                                    child: SpinKitCircle(
                                                  color: AppColor.white,
                                                  size: 3.h,
                                                )),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.sp,
                                                    right: 10.sp,
                                                    top: 8.sp,
                                                    bottom: 10.sp),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AppContainer(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            NewsDetailedScreen
                                                                .routeName,
                                                            arguments: {
                                                              "image":
                                                                  homeController
                                                                      .newsModel
                                                                      .value
                                                                      .news?[
                                                                          index]
                                                                      .image,
                                                              "title":
                                                                  homeController
                                                                      .newsModel
                                                                      .value
                                                                      .news?[
                                                                          index]
                                                                      .title,
                                                              "subtitle":
                                                                  homeController
                                                                      .newsModel
                                                                      .value
                                                                      .news?[
                                                                          index]
                                                                      .smallDesc,
                                                              "time": homeController.timeAgo(homeController.data(
                                                                  homeController
                                                                      .newsModel
                                                                      .value
                                                                      .news?[
                                                                          index]
                                                                      .time)),
                                                            });
                                                      },
                                                      height: 20.h,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
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
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    CustomeText(
                                                      title:
                                                          "${homeController.newsModel.value.news?[index].smallDesc}",
                                                      fontSize: 8.sp,
                                                      color: AppColor.whiteColor
                                                          .withOpacity(0.5),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    CustomeText(
                                                      title:
                                                          "${homeController.newsModel.value.news?[index].newsSource}",
                                                      fontSize: 8.sp,
                                                      color: AppColor.whiteColor
                                                          .withOpacity(0.5),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    CustomeText(
                                                      title: homeController
                                                          .timeAgo(homeController
                                                              .data(
                                                                  homeController
                                                                      .newsModel
                                                                      .value
                                                                      .news?[
                                                                          index]
                                                                      .time)),
                                                      fontSize: 8.sp,
                                                      color: AppColor.whiteColor
                                                          .withOpacity(0.5),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
