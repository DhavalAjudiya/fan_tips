import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/widget/custom_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import '../../../../commanWidget/commanText.dart';
import '../../../../widget/custom_container.dart';
import '../controller/upcoming_controller.dart';
import '../../../../utills/string.dart';
import '../controller/upcoming_controller.dart';

class FantasyTab extends StatelessWidget {
  FantasyTab({Key? key}) : super(key: key);
  final upcomingController = Get.put(UpcomingMatchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
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

                          showModalBottomSheet(
                            backgroundColor: AppColor.containerBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.sp),
                                topRight: Radius.circular(12.sp),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 28.h,
                                decoration: BoxDecoration(
                                  color: AppColor.containerBackgroundColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.sp),
                                    topRight: Radius.circular(12.sp),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.line,
                                            color: AppColor.whiteColor,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          CustomeText(
                                            title: AppString.sortBy,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 80.h,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const Divider(
                                            height: 0,
                                            color: AppColor.verticalDivider,
                                          ),
                                          itemCount: upcomingController
                                              .titleScore.value.length,
                                          itemBuilder: (context, index) {
                                            var data = upcomingController
                                                .titleScore[index];
                                            return Obx(
                                              () => ListTile(
                                                title: CustomeText(
                                                  title: data,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                trailing: ((upcomingController
                                                            .index.value ==
                                                        0)
                                                    ? upcomingController
                                                                .selectedBottomSheetText
                                                                .value ==
                                                            upcomingController
                                                                .titleScore[
                                                                    index]
                                                                .toString()
                                                        ? const CircleAvatar(
                                                            radius: 8,
                                                            backgroundColor:
                                                                AppColor.white,
                                                            child: Icon(
                                                                Icons.done,
                                                                size: 12),
                                                          )
                                                        : const Text("")
                                                    : const Text("")),
                                                onTap: () {
                                                  if (upcomingController
                                                          .index.value ==
                                                      0) {
                                                    upcomingController
                                                            .selectedBottomSheetText
                                                            .value =
                                                        upcomingController
                                                            .titleScore[index]
                                                            .toString();
                                                  }
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: AppContainer(
                          height: 5.h,
                          borderRadius: BorderRadius.circular(5.sp),
                          color: AppColor.blackColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImage.line,
                                height: 1.7.h,
                                color: upcomingController.select.value == 0
                                    ? AppColor.greenColor
                                    : AppColor.textColor,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Obx(
                                () => CustomeText(
                                  title: upcomingController
                                      .selectedBottomSheetText.value,
                                  color: upcomingController.select.value == 0
                                      ? AppColor.greenColor
                                      : AppColor.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ),
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
                                color: upcomingController.select.value == 1
                                    ? AppColor.greenColor
                                    : AppColor.textColor,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              CustomeText(
                                title: AppString.favourites,
                                color: upcomingController.select.value == 1
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
                        height: 17.h,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18.sp,
                                    child: Image.asset(AppImage.t20logo),
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomeText(
                                                  title:
                                                      AppString.t20Predictions,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.textColor,
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
                                                    title: AppString.subscriber,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.textColor,
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
                                                BorderRadius.circular(2.sp),
                                            child: Center(
                                              child: CustomeText(
                                                title: AppString.teams,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.greenColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => InkWell(
                                      onTap: () {
                                        if (upcomingController
                                                .favoriteItem.value ==
                                            false) {
                                          upcomingController
                                              .favoriteItem.value = true;
                                        } else {
                                          upcomingController
                                              .favoriteItem.value = false;
                                        }
                                      },
                                      child: upcomingController
                                                  .favoriteItem.value ==
                                              false
                                          ? const Icon(
                                              Icons.favorite_outline,
                                              color: AppColor.textColor,
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
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
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
                  offset: Offset(1,3),
                  blurRadius: 2.sp,
                  color: AppColor.grey.withOpacity(0.4),
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
    );
  }
}
