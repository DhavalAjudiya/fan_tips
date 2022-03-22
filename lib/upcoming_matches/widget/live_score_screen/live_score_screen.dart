import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../../T20Predictions/page/utills/asset.dart';
import '../../../commanWidget/commanText.dart';
import '../../../expert/page/search_screen.dart';
import '../../../screen/ipl_screen/page/fantasy_tabBar.dart';
import '../../../screen/ipl_screen/widget/fantasyTabBar/wight/container/container_custom.dart';
import '../../../utills/string.dart';
import '../../../T20Predictions/page/utills/color.dart';
import '../../../ipl_screen/controller/ipl_controller.dart';
import 'commentry_screen.dart';

class LiveScoreScreen extends StatelessWidget {
  static const routeName = '/LiveScoreScreen';
  LiveScoreScreen({Key? key}) : super(key: key);
  final IplController iplController = Get.put(IplController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        backgroundColor: AppColor.greyBackGround,
        leading: InkWell(
          onTap: () {
            Get.back();
            print("objeasdadasdct");
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('CSK batting'),
        actions: [
          InkWell(
            onTap: () {
              print("objeasdadasdct");
              Get.toNamed(Search.routeName);
            },
            child: Icon(
              Icons.search,
              size: 2.7.h,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: iplController.tabController1,
              tabs: iplController.upcoming,
              indicatorColor: AppColor.greenColor,
              indicatorWeight: 2.5,
              isScrollable: true,
              labelColor: AppColor.greenColor,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              unselectedLabelStyle:
                  const TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: iplController.tabController1,
        children: [
          // fantasy
          FantasyTabBar(),
          // commentry
          Commentary(),
          // scorecard
          // ScoreCardScreen(),
          // quiz
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
                                SvgPicture.asset(AppImage.greenStar),
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
                              SvgPicture.asset(AppImage.trophy),
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
                  // gradient: LinearGradient(
                  //   colors: [
                  //     AppColor.gradientGreen.withOpacity(0.2),
                  //     AppColor.blackColor.withOpacity(0.8)
                  //   ],
                  //   begin: Alignment.centerRight,
                  //   end: Alignment.center,
                  // ),

                  borderRadius: BorderRadius.circular(8.sp),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.sp, right: 12.sp, top: 10.sp),
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
                            SvgPicture.asset(AppImage.timeCircle, height: 2.h),
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
                          value: 1,
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
                                              width: 0.4.w),
                                        ),
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
                                fontSize: 11.sp,
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
    );
  }
}
