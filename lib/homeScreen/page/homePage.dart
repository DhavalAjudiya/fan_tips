import 'dart:io';

import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/expert/data/controller.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:fantips/homeScreen/page/newsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import '../../widget/google_sign_in_repo.dart';
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
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomeText(
                  title: AppString.no,
                  fontSize: 15.sp,
                ),
              ),
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 15.sp, right: 10.sp, top: 8.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeText(
                        title: AppString.fanTips,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
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
                                    height: 2.h,
                                  ),
                                  AppContainer(
                                    height: 6.h,
                                    width: 60.w,
                                    color: AppColor.containerBackground,
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      signInWithGoogle().then((data) {
                                        ipController.isLoggedIn.value = true;
                                        ipController.userObj = data;
                                      }).catchError((e) {});
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(AppImage.google,
                                            height: 8.w),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                          },
                          child: ipController.isLoggedIn.value == false
                              ? CustomeText(
                                  title: AppString.login,
                                  color: AppColor.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.sp,
                                )
                              : Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ProfileScreen());
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColor.transparent,
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                            "${ipController.userObj?.user?.photoURL}"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Icon(Icons.favorite_outline)
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
                    fontWeight: FontWeight.w700,
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
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                FeaturedExpertContainer(),
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
                      return Obx(
                        () => Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 8.sp),
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
                                        "subtitle": homeController.newsModel
                                            .value.news?[index].smallDesc,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              CustomeText(
                                title:
                                    "${homeController.newsModel.value.news?[index].smallDesc}",
                                fontSize: 9.sp,
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
                                title: homeController.timeAgo(
                                    homeController.data(homeController
                                        .newsModel.value.news?[index].time)),
                                fontSize: 8.sp,
                                color: AppColor.whiteColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
