import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../commanWidget/commanText.dart';
import '../../expert/data/controller.dart';
import '../../matches/controler/matchs_controller.dart';
import '../../matches/controler/utils_time.dart';
import '../../upcoming_matches/live_score_screen/live_score_screen.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import '../data/homepageController.dart';

class MatchForYouContainer extends StatelessWidget {
  MatchForYouContainer({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final MatchesScreenController _homeController =
      Get.put(MatchesScreenController());
  final IpController ipController = Get.put(IpController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 17.h,
            child: PageView.builder(
              controller: homeController.pageController,
              onPageChanged: (value) {
                homeController.matchSelect.value = value;
              },
              itemCount: _homeController
                      .currentMatch.value.matches?.notstarted?.length ??
                  0,
              itemBuilder: (BuildContext context, int index) {
                final matchData = _homeController
                    .currentMatch.value.matches?.notstarted?[index];
                return homeController.isLoading.value == true
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 40, top: 10),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : AppContainer(
                        onTap: () {
                          Get.toNamed(LiveScoreScreen.routeName);
                        },
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        borderRadius: BorderRadius.circular(10.sp),
                        color: AppColor.blackColor,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp,
                              right: 10.sp,
                              top: 4.sp,
                              bottom: 2.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomeText(
                                    title: matchData?.header ?? "",
                                    color: AppColor.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => InkWell(
                                      onTap: () {
                                        if (_homeController
                                                .currentMatch
                                                .value
                                                .matches
                                                ?.notstarted?[index]
                                                .selected ==
                                            false) {
                                          _homeController
                                              .currentMatch
                                              .value
                                              .matches
                                              ?.notstarted?[index]
                                              .selected
                                              .value = true;
                                          _homeController.addNotificationItem(
                                              _homeController.currentMatch.value
                                                  .matches!.notstarted![index]);
                                        } else {
                                          _homeController
                                              .removeNotificationItem(
                                                  _homeController
                                                      .currentMatch
                                                      .value
                                                      .matches!
                                                      .notstarted![index]);
                                          _homeController
                                              .currentMatch
                                              .value
                                              .matches
                                              ?.notstarted?[index]
                                              .selected
                                              .value = false;
                                        }
                                      },
                                      child: _homeController
                                                  .currentMatch
                                                  .value
                                                  .matches
                                                  ?.notstarted?[index]
                                                  .selected
                                                  .value ==
                                              false
                                          ? Icon(
                                              Icons.notifications_none,
                                              size: 13.sp,
                                            )
                                          : Icon(
                                              Icons.notifications,
                                              size: 13.sp,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 5.w,
                                                backgroundImage: NetworkImage(
                                                  matchData?.t1Flag ??
                                                      AppString.imageNotFound,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              CustomeText(
                                                title:
                                                    matchData?.team1Name ?? "",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 1.h),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 5.w,
                                                backgroundImage: NetworkImage(
                                                  matchData?.t2Flag ??
                                                      AppString.imageNotFound,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              CustomeText(
                                                title:
                                                    matchData?.team2Name ?? "",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10.sp,
                                              ),
                                              // CustomeText(
                                              //   title: AppString.scoWik,
                                              //   fontWeight: FontWeight.w700,
                                              //   fontSize: 10.sp,
                                              // ),
                                              // SizedBox(
                                              //   width: 1.w,
                                              // ),
                                              // CustomeText(
                                              //   title: AppString.andSing,
                                              //   fontWeight: FontWeight.w700,
                                              //   fontSize: 10.sp,
                                              // ),
                                              // SizedBox(
                                              //   width: 1.w,
                                              // ),
                                              // CustomeText(
                                              //   title: AppString.scoWik,
                                              //   fontWeight: FontWeight.w700,
                                              //   fontSize: 10.sp,
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                      // CustomeText(
                                      //   title: AppString.scoWik,
                                      //   fontWeight: FontWeight.w700,
                                      //   fontSize: 10.sp,
                                      // ),
                                      // SizedBox(
                                      //   width: 1.w,
                                      // ),
                                      // CustomeText(
                                      //   title: AppString.andSing,
                                      //   fontWeight: FontWeight.w700,
                                      //   fontSize: 10.sp,
                                      // ),
                                      // SizedBox(
                                      //   width: 1.w,
                                      // ),
                                      // CustomeText(
                                      //   title: AppString.scoWik,
                                      //   fontWeight: FontWeight.w700,
                                      //   fontSize: 10.sp,
                                      // )
                                    ],
                                  ),
                                  Spacer(),
                                  AppContainer(
                                    height: 9.h,
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
                              SizedBox(
                                height: 0.5.h,
                              ),
                              CustomeText(
                                title:
                                    "Match Start in ${Utils.hourAndMin(matchData?.startTime ?? 0)}",
                                fontSize: 10.sp,
                              )
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (_homeController.currentMatch.value.matches?.notstarted?.length ??
                  0),
              (index) => AppContainer(
                height: 0.6.h,
                width: homeController.matchSelect.value == index ? 4.w : 3.w,
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                borderRadius: BorderRadius.circular(8.sp),
                color: homeController.matchSelect.value == index
                    ? AppColor.greenColor
                    : AppColor.grey.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
