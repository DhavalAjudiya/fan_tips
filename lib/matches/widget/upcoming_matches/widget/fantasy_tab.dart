import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:fantips/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import '../../../../commanWidget/commanText.dart';
import '../../../../widget/custom_container.dart';
import '../controller/upcoming_controller.dart';
import '../../../../utills/string.dart';

class LiveFantasyTab extends StatelessWidget {
  LiveFantasyTab({Key? key}) : super(key: key);
  final upcomingController = Get.put(UpcomingMatchController());
  final data = Get.arguments;
  final HomeController homeController = Get.put(HomeController());

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
                        backgroundImage: NetworkImage(data["t1img"]),
                      ),
                      CustomeText(
                        title: data['t1name'],
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
                            title: data['time'],
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      CustomeText(
                        title: data['t2name'],
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      CircleAvatar(
                        radius: 18.sp,
                        backgroundImage: NetworkImage(data["t2img"]),
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
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: AppColor.containerBackgroundColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.sp),
                                    topRight: Radius.circular(12.sp),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.sp, right: 10.sp, top: 10.sp),
                                  child: Obx(
                                    () => Column(
                                      children: [
                                        Row(
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
                                        Divider(),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (upcomingController.isSelect =
                                                true) {
                                              upcomingController.index.value =
                                                  0;
                                              homeController.predictionsData
                                                  .value.tipsters
                                                  ?.sort((a, b) => a
                                                      .totalPredictions!
                                                      .compareTo(
                                                          b.totalPredictions!));
                                            } else {
                                              upcomingController.isSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              CustomeText(
                                                title: AppString.prediction,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                              ),
                                              const Spacer(),
                                              upcomingController.index.value ==
                                                      0
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(Icons.done,
                                                          size: 12),
                                                    )
                                                  : const CustomeText(
                                                      title: "",
                                                    )
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (upcomingController.isSelect =
                                                true) {
                                              upcomingController.index.value =
                                                  1;
                                              homeController.predictionsData
                                                  .value.tipsters
                                                  ?.sort((a, b) => a.avgScore!
                                                      .compareTo(b.avgScore!));
                                            } else {
                                              upcomingController.isSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              CustomeText(
                                                title: AppString.average_score,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                              ),
                                              const Spacer(),
                                              upcomingController.index.value ==
                                                      1
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(Icons.done,
                                                          size: 12),
                                                    )
                                                  : const CustomeText(
                                                      title: "",
                                                    )
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (upcomingController.isSelect =
                                                true) {
                                              upcomingController.index.value =
                                                  2;
                                              homeController.predictionsData
                                                  .value.tipsters
                                                  ?.sort((a, b) => a.top3!
                                                      .compareTo(b.top3!));
                                            } else {
                                              upcomingController.isSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              CustomeText(
                                                title: AppString.wins,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                              ),
                                              const Spacer(),
                                              upcomingController.index.value ==
                                                      2
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(Icons.done,
                                                          size: 12),
                                                    )
                                                  : const CustomeText(
                                                      title: "",
                                                    )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                  title: upcomingController.index.value == 0
                                      ? AppString.prediction
                                      : upcomingController.index.value == 1
                                          ? AppString.average_score
                                          : upcomingController.index.value == 2
                                              ? AppString.wins
                                              : "",
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
              Obx(
                () {
                  return upcomingController.select.value == 0
                      ? Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: homeController
                                  .predictionsData.value.tipsters?.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomeText(
                                                            title:
                                                                '${(homeController.predictionsData.value.tipsters?[index].name?.length ?? 0) >= 20 ? (homeController.predictionsData.value.tipsters?[index].name?.substring(0, 12) ?? 0) : (homeController.predictionsData.value.tipsters?[index].name ?? 0)}...',
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                          title:
                                                              AppString.teams,
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .greenColor,
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
                                                  if (homeController
                                                          .predictionsData
                                                          .value
                                                          .tipsters?[index]
                                                          .wishlist ==
                                                      false) {
                                                    homeController
                                                        .predictionsData
                                                        .value
                                                        .tipsters?[index]
                                                        .wishlist
                                                        .value = true;
                                                    homeController.addProduct(
                                                        homeController
                                                            .predictionsData
                                                            .value
                                                            .tipsters![index]);
                                                  } else {
                                                    homeController.removeProduct(
                                                        homeController
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
                                                child: homeController
                                                            .predictionsData
                                                            .value
                                                            .tipsters?[index]
                                                            .wishlist ==
                                                        false
                                                    ? const Icon(
                                                        Icons.favorite_outline,
                                                        color:
                                                            AppColor.textColor,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color:
                                                            AppColor.greenColor,
                                                      ),
                                              ),
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
                                                      title:
                                                          "${homeController.predictionsData.value.tipsters?[index].totalPredictions}",
                                                      color: AppColor.textColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13.sp),
                                                  CustomeText(
                                                    title:
                                                        AppString.predictions,
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
                                                      title:
                                                          "${homeController.predictionsData.value.tipsters?[index].avgScore}",
                                                      color: AppColor.textColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13.sp),
                                                  CustomeText(
                                                    title:
                                                        AppString.averageScore,
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
                                                      title:
                                                          "${homeController.predictionsData.value.tipsters?[index].top3}",
                                                      color: AppColor.textColor,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                      : upcomingController.select.value == 1
                          ? Expanded(
                              child: SizedBox(
                                child: ListView.builder(
                                  itemCount:
                                      homeController.wishListItems.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AppContainer(
                                      height: 17.h,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 2.sp),
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: AppColor.blackColor,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.sp,
                                            right: 10.sp,
                                            top: 8.sp,
                                            bottom: 5.sp),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 18.sp,
                                                  backgroundImage: NetworkImage(
                                                      "${homeController.wishListItems[index].profileUrl}"),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomeText(
                                                                title:
                                                                    '${(homeController.wishListItems[index].name?.length ?? 0) >= 20 ? (homeController.predictionsData.value.tipsters?[index].name?.substring(0, 12) ?? 0) : (homeController.predictionsData.value.tipsters?[index].name ?? 0)}...',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColor
                                                                    .textColor,
                                                                fontSize:
                                                                    12.sp),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Image.asset(
                                                                  AppImage
                                                                      .youtube,
                                                                  height: 2.h,
                                                                  width: 3.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 1.w,
                                                                ),
                                                                CustomeText(
                                                                  title:
                                                                      "${homeController.wishListItems[index].subscriberCount}",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColor
                                                                      .textColor,
                                                                  fontSize:
                                                                      8.sp,
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
                                                          color:
                                                              AppColor.offBlack,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.sp),
                                                          child: Center(
                                                            child: CustomeText(
                                                              title: AppString
                                                                  .teams,
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .greenColor,
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
                                                      homeController.removeProduct(
                                                          homeController
                                                                  .wishListItems[
                                                              index]);
                                                    },
                                                    child: const Icon(
                                                      Icons.favorite,
                                                      color:
                                                          AppColor.greenColor,
                                                    ),
                                                  ),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      CustomeText(
                                                          title:
                                                              "${homeController.wishListItems[index].totalPredictions}",
                                                          color: AppColor
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 13.sp),
                                                      CustomeText(
                                                        title: AppString
                                                            .predictions,
                                                        fontSize: 10.sp,
                                                        color:
                                                            AppColor.textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 6.h,
                                                    width: 0.2.w,
                                                    color: AppColor
                                                        .verticalDivider,
                                                  ),
                                                  Column(
                                                    children: [
                                                      CustomeText(
                                                          title:
                                                              "${homeController.wishListItems[index].avgScore}",
                                                          color: AppColor
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 13.sp),
                                                      CustomeText(
                                                        title: AppString
                                                            .averageScore,
                                                        fontSize: 10.sp,
                                                        color:
                                                            AppColor.textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 6.h,
                                                    width: 0.2.w,
                                                    color: AppColor
                                                        .verticalDivider,
                                                  ),
                                                  Column(
                                                    children: [
                                                      CustomeText(
                                                          title:
                                                              "${homeController.wishListItems[index].top3}",
                                                          color: AppColor
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 13.sp),
                                                      CustomeText(
                                                        title: AppString.wins,
                                                        fontSize: 10.sp,
                                                        color:
                                                            AppColor.textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                          : SizedBox();
                },
              )
            ],
          ),
          Obx(
            () => upcomingController.select.value == 0
                ? Positioned(
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
                          offset: Offset(1, 3),
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
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
