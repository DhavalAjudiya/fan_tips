import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/upcoming_matches/controller/upcoming_controller.dart';
import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import '../widget/bestpicks_tab.dart';
import '../widget/fantasy_tab.dart';

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
            FantasyTab(),

            ///bestPicks tab
            BestPicksTab(),
            Container(),

            /// quiz tab
            Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.sp),
              child: Column(
                children: [
                  AppContainer(
                    height: 8.h,
                    color: AppColor.blackColor,
                    borderRadius: BorderRadius.circular(8.sp),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/image/greenstar.svg"),
                                  CustomeText(
                                    title: "429",
                                    fontSize: 20.sp,
                                    color: AppColor.greenColor,
                                  )
                                ],
                              ),
                              CustomeText(
                                title: AppString.totalPoints,
                                color: AppColor.greenColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                          const Spacer(),
                          AppContainer(
                            height: 5.h,
                            width: 35.w,
                            border: Border.all(color: AppColor.borderColor),
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/image/trophy.svg"),
                                SizedBox(
                                  width: 1.w,
                                ),
                                CustomeText(
                                  title: AppString.leaderboard,
                                  color: AppColor.borderColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w900,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomeText(
                    title: AppString.nextQuestion,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                  ),
                  CustomeText(
                    title: "01:45:30",
                    fontSize: 20.sp,
                    color: AppColor.greenColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppContainer(
                    height: 27.h,
                    color: AppColor.blackColor,
                    borderRadius: BorderRadius.circular(8.sp),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.sp, right: 12.sp, top: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomeText(
                                title: AppString.question,
                                color: AppColor.quizTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                              CustomeText(
                                title: AppString.totalQuestion,
                                color: AppColor.quizTextColor,
                                fontSize: 8.sp,
                              ),
                              const Spacer(),
                              SvgPicture.asset("assets/image/timecircle.svg",
                                  height: 2.h),
                              CustomeText(
                                title: "45s",
                                color: AppColor.quizTextColor,
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.8.h,
                          ),
                          LinearProgressIndicator(
                            backgroundColor: AppColor.quizTextColor,
                            color: AppColor.greenColor,
                            minHeight: 0.2.h,
                            value: 10,
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          CustomeText(
                            title:
                                "Who will be the Man of the Match for today’s match?",
                            fontSize: 10.sp,
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          Row(
                            children: [
                              AppContainer(
                                height: 4.h,
                                width: 40.w,
                                border: Border.all(color: AppColor.borderColor),
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    children: [
                                      CustomeText(
                                        title: "Rohit Sharma",
                                        fontSize: 8.sp,
                                        color: AppColor.quizTextColor,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        child: Container(
                                          height: 2.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.borderColor,
                                                  width: 0.4.w)),
                                        ),
                                      )
                                      // Radio(
                                      //     visualDensity: const VisualDensity(
                                      //         horizontal:
                                      //             VisualDensity.minimumDensity,
                                      //         vertical:
                                      //             VisualDensity.minimumDensity),
                                      //     materialTapTargetSize:
                                      //         MaterialTapTargetSize.shrinkWrap,
                                      //     value: 1,
                                      //     groupValue: 0,
                                      //     onChanged: (v) {})
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              AppContainer(
                                height: 4.h,
                                width: 40.w,
                                border: Border.all(color: AppColor.borderColor),
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    children: [
                                      CustomeText(
                                        title: "Virat Kohli",
                                        fontSize: 8.sp,
                                        color: AppColor.quizTextColor,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        child: Container(
                                          height: 2.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.borderColor,
                                                  width: 0.4.w)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          Row(
                            children: [
                              AppContainer(
                                height: 4.h,
                                width: 40.w,
                                border: Border.all(color: AppColor.borderColor),
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    children: [
                                      CustomeText(
                                        title: "Rohit Sharma",
                                        fontSize: 8.sp,
                                        color: AppColor.quizTextColor,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        child: Container(
                                          height: 2.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.borderColor,
                                                  width: 0.4.w)),
                                        ),
                                      )
                                      // Radio(
                                      //     visualDensity: const VisualDensity(
                                      //         horizontal:
                                      //             VisualDensity.minimumDensity,
                                      //         vertical:
                                      //             VisualDensity.minimumDensity),
                                      //     materialTapTargetSize:
                                      //         MaterialTapTargetSize.shrinkWrap,
                                      //     value: 1,
                                      //     groupValue: 0,
                                      //     onChanged: (v) {})
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              AppContainer(
                                height: 4.h,
                                width: 40.w,
                                border: Border.all(color: AppColor.borderColor),
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    children: [
                                      CustomeText(
                                        title: "Virat Kohli",
                                        fontSize: 8.sp,
                                        color: AppColor.quizTextColor,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        child: Container(
                                          height: 2.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.borderColor,
                                                  width: 0.4.w)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Center(
                            child: AppContainer(
                              height: 3.5.h,
                              width: 25.w,
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(color: AppColor.borderColor),
                              child: Center(
                                child: CustomeText(
                                  title: AppString.submit,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
