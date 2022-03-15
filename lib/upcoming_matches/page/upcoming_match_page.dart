import 'dart:developer';

import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/upcoming_matches/controller/upcoming_controller.dart';
import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';

class UpcomingMatchScreen extends StatelessWidget {
  static const routeName = "/UpcomingMatchScreen";

  UpcomingMatchScreen({Key? key}) : super(key: key);
  final upcomingController = Get.put(UpcomingMatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorBlack,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.textColor,
                size: 15.sp,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            CustomeText(
              title: "MI",
              color: AppColor.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              width: 1.w,
            ),
            SvgPicture.asset("assets/image/flash.svg", height: 1.5.h),
            SizedBox(
              width: 1.w,
            ),
            CustomeText(
              title: "RCB",
              color: AppColor.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        bottom: TabBar(
          unselectedLabelColor: AppColor.textColor,
          isScrollable: true,
          indicatorColor: AppColor.greenColor,
          indicatorWeight: 1.5.sp,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColor.greenColor,
          controller: upcomingController.tabController,
          tabs: [
            Tab(
              child: CustomeText(
                title: AppString.fantasyTab,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Tab(
              child: CustomeText(
                title: AppString.bestPicksTab,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Tab(
              child: CustomeText(
                title: AppString.myTeamTab,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Tab(
              child: CustomeText(
                title: AppString.quizTab,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColor.textColor,
                size: 18.sp,
              ))
        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: upcomingController.tabController,
          children: [
            ///fantasy tab
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp),
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppContainer(
                        height: 12.h,
                        color: AppColor.blackColor,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 18.sp,
                              ),
                              const CustomeText(
                                title: "MI",
                                fontWeight: FontWeight.w700,
                                color: AppColor.textColor,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomeText(
                                    title: "Match Starts In",
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 9.sp,
                                  ),
                                  CustomeText(
                                    title: "5h 30m",
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                              const CustomeText(
                                title: "RCB",
                                fontWeight: FontWeight.w700,
                                color: AppColor.textColor,
                              ),
                              CircleAvatar(
                                radius: 18.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (upcomingController.isSelect = true) {
                                    upcomingController.select.value = 0;
                                  } else {
                                    upcomingController.isSelect = false;
                                  }
                                },
                                child: AppContainer(
                                  height: 5.h,
                                  borderRadius: BorderRadius.circular(5.sp),
                                  color: AppColor.blackColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/image/line.svg",
                                        height: 1.7.h,
                                        color:
                                            upcomingController.select.value == 0
                                                ? AppColor.greenColor
                                                : AppColor.textColor,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.avgScore,
                                        color:
                                            upcomingController.select.value == 0
                                                ? AppColor.greenColor
                                                : AppColor.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  log("se");
                                  if (upcomingController.isSelect = true) {
                                    upcomingController.select.value = 1;
                                  } else {
                                    upcomingController.isSelect = false;
                                  }
                                },
                                child: AppContainer(
                                  height: 5.h,
                                  borderRadius: BorderRadius.circular(5.sp),
                                  color: AppColor.blackColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        color:
                                            upcomingController.select.value == 1
                                                ? AppColor.greenColor
                                                : AppColor.textColor,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomeText(
                                        title: AppString.favourites,
                                        color:
                                            upcomingController.select.value == 1
                                                ? AppColor.greenColor
                                                : AppColor.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: 10,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AppContainer(
                                height: 16.h,
                                margin: EdgeInsets.symmetric(vertical: 2.sp),
                                borderRadius: BorderRadius.circular(10.sp),
                                color: AppColor.blackColor,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.sp,
                                      right: 10.sp,
                                      top: 8.sp,
                                      bottom: 5.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 18.sp,
                                            child: Image.asset(
                                                "assets/image/t20.png"),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomeText(
                                                          title: AppString
                                                              .t20Predictions,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColor
                                                              .textColor,
                                                          fontSize: 12.sp),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
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
                                                            title: AppString
                                                                .subscriber,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColor
                                                                .textColor,
                                                            fontSize: 8.sp,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  AppContainer(
                                                    height: 2.h,
                                                    width: 13.w,
                                                    color: AppColor.offBlack,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp),
                                                    child: Center(
                                                      child: CustomeText(
                                                        title: AppString.teams,
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColor.greenColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.favorite_outline,
                                            color: AppColor.textColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.sp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                CustomeText(
                                                    title: "72",
                                                    color: AppColor.textColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.sp),
                                                CustomeText(
                                                  title: AppString.predictions,
                                                  fontSize: 10.sp,
                                                  color: AppColor.textColor,
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
                                                    color: AppColor.textColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.sp),
                                                CustomeText(
                                                  title: AppString.averageScore,
                                                  fontSize: 10.sp,
                                                  color: AppColor.textColor,
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
                                                    color: AppColor.textColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.sp),
                                                CustomeText(
                                                  title: AppString.wins,
                                                  fontSize: 10.sp,
                                                  color: AppColor.textColor,
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
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 35.sp,
                    left: 100.sp,
                    child: AppContainer(
                      onTap: () {},
                      height: 5.h,
                      width: 30.w,
                      color: AppColor.greenColor,
                      borderRadius: BorderRadius.circular(5.sp),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.sp,
                          color: AppColor.whiteColor.withOpacity(0.5),
                        )
                      ],
                      child: Center(
                        child: CustomeText(
                          title: AppString.createTeams,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///bestPicks tab
            Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        childrenPadding:
                            EdgeInsets.only(left: 10.sp, right: 10.sp),
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/glove.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.wk,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.wicketKeeper,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/bat.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.bat,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.batsman,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/batball.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.ar,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.allRounder,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/ball.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.bowl,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.bowler,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/captain.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.cap,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.captain,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: AppColor.blackColor,
                      child: ExpansionTile(
                        backgroundColor: AppColor.blackColor,
                        iconColor: AppColor.whiteColor,
                        title: Row(
                          children: [
                            AppContainer(
                              width: 22.w,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/vicecaptain.svg",
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  CustomeText(
                                    title: AppString.vc,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomeText(
                              title: AppString.viceCaptain,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        children: [
                          Divider(
                            height: 0.4.sp,
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomeText(
                                  title: AppString.playerName,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomeText(
                                  title: AppString.selectedBy,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: AppContainer(
                              height: 6.h,
                              width: 13.w,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Text("NO IMAGE!!!"),
                                ),
                              ),
                            ),
                            title: CustomeText(
                              title: "Rohit Sharma",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                            subtitle: CustomeText(
                              title: "MI",
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: CustomeText(
                                title: "19.75%",
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),

            /// quiz tab
            Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.sp),
              child: Column(
                children: [
                  AppContainer(
                    height: 10.h,
                    color: AppColor.blackColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
