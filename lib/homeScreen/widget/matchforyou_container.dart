import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../commanWidget/commanText.dart';
import '../../matches/controler/matchs_controller.dart';
import '../../upcoming_matches/widget/live_score_screen/live_score_screen.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import '../data/homepageController.dart';

class MatchForYouContainer extends StatelessWidget {
  MatchForYouContainer({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final _homecontroller = Get.put(MatchsScreenControoler());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 18.h,
            child: PageView.builder(
              controller: homeController.pageController,
              onPageChanged: (value) {
                homeController.matchSelect.value = value;
              },
              itemCount: _homecontroller
                      .currentMatch.value.matches?.notstarted?.length ??
                  4,
              itemBuilder: (BuildContext context, int index) {
                final matchData = _homecontroller
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
                              top: 8.sp,
                              bottom: 8.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomeText(
                                    title: matchData?.matchName ?? "",
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => InkWell(
                                      onTap: () {
                                        if (homeController
                                                .notificationsItem.value ==
                                            false) {
                                          homeController
                                              .notificationsItem.value = true;
                                        } else {
                                          homeController
                                              .notificationsItem.value = false;
                                        }
                                      },
                                      child: homeController
                                                  .notificationsItem.value ==
                                              false
                                          ? SvgPicture.asset(
                                              AppImage.notification,
                                              color: AppColor.whiteColor,
                                            )
                                          : SvgPicture.asset(
                                              AppImage.notification,
                                              color: AppColor.greenColor),
                                    ),
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
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10.sp,
                                              ),
                                              const Spacer(),
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
                                          const Spacer(),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 9.sp,
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
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10.sp,
                                              ),
                                              const Spacer(),
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
                                title: _homecontroller.timeAgo(
                                    _homecontroller.time(matchData?.startTime)),
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
              (_homecontroller.currentMatch.value.matches?.notstarted?.length ??
                  0),
              (index) => AppContainer(
                height: 0.6.h,
                width: homeController.matchSelect.value == index ? 4.w : 3.w,
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
