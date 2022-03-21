import 'dart:developer';

import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/ipl_screen/controller/ipl_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../utills/string.dart';
import '../../../../widget/custom_container.dart';
import '../../page/utils/icon.dart';
import '../../page/wight/icon/icon_button.dart';
import '../../page/wight/text/custom_text.dart';

class FantasyTabBar extends StatelessWidget {
  final IplController iplController = Get.put(IplController());
  FantasyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                AppContainer(
                  height: 10.h,
                  color: AppColor.blackColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17.sp,
                          backgroundImage: AssetImage(AppImage.ind),
                        ),
                        SizedBox(width: 1.5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomeText(
                              title: AppString.ind,
                              color: AppColor.textColor,
                              fontSize: 1.3.h,
                            ),
                            CustomeText(
                              title: AppString.indScore,
                              fontSize: 1.7.h,
                              color: AppColor.textColor,
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppImage.flash,
                          height: 1.8.h,
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomeText(
                              title: AppString.zim,
                              color: AppColor.textColor,
                              fontSize: 1.3.h,
                            ),
                            CustomeText(
                              title: AppString.zimScore,
                              fontSize: 1.8.h,
                              color: AppColor.textColor,
                            ),
                          ],
                        ),
                        SizedBox(width: 1.5.w),
                        CircleAvatar(
                          radius: 17.sp,
                          backgroundImage: AssetImage(AppImage.zim),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: iplController.service.value.tipsters!.length,
                      itemBuilder: (context, index) {
                        log("data=>>${iplController.service.value.tipsters!.length}");
                        var item = iplController.service.value.tipsters![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AppContainer(
                            onTap: () {},
                            height: 15.h,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.greyBlack,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "${item.profileUrl ?? "not found"}",
                                        ),
                                        radius: 3.2.h,
                                      ),
                                      SizedBox(width: 3.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 1.5.h,
                                            width: 50.w,
                                            child: AppCustomText(
                                              data: "${item.name ?? ""}",
                                              // "${_searchController.service!.tipsters![0].name}",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 1.5.h,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Row(
                                            children: [
                                              Image(
                                                image: const AssetImage(
                                                  AppImage.youtube,
                                                ),
                                                height: 1.3.h,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              AppCustomText(
                                                data:
                                                    "${item.subscriberCount ?? 0}",
                                                //"${_searchController.service!.tipsters![0].subscriberCount}",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 1.2.h,
                                                color: AppColor.greya,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Obx(
                                        () => AppIconCustom(
                                          onPressed: () {
                                            iplController
                                                    .service
                                                    .value
                                                    .tipsters![index]
                                                    .selected
                                                    .value =
                                                !iplController
                                                    .service
                                                    .value
                                                    .tipsters![index]
                                                    .selected
                                                    .value;
                                          },
                                          color: iplController
                                                  .service
                                                  .value
                                                  .tipsters![index]
                                                  .selected
                                                  .value
                                              ? AppColor.grey
                                              : AppColor.green,
                                          icon: AppIcon.favorite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          AppCustomText(
                                            data:
                                                "${item.totalPredictions ?? 0}",
                                            color: AppColor.greya,
                                            fontSize: 3.h,
                                          ),
                                          AppCustomText(
                                            data: AppString.prediction,
                                            color: AppColor.greya,
                                            fontSize: 1.5.h,
                                          ),
                                        ],
                                      ),
                                      AppContainer(
                                        height: 5.h,
                                        width: 0.1.w,
                                        color: AppColor.grey,
                                      ),
                                      Column(
                                        children: [
                                          AppCustomText(
                                            data: "${item.avgScore ?? 0}",
                                            color: AppColor.greya,
                                            fontSize: 3.h,
                                          ),
                                          AppCustomText(
                                            data: AppString.avregescor,
                                            color: AppColor.greya,
                                            fontSize: 1.5.h,
                                          ),
                                        ],
                                      ),
                                      AppContainer(
                                        height: 5.h,
                                        width: 0.1.w,
                                        color: AppColor.grey,
                                      ),
                                      Column(
                                        children: [
                                          AppCustomText(
                                            data: "${item.top3 ?? 0}",
                                            color: AppColor.greya,
                                            fontSize: 3.h,
                                          ),
                                          AppCustomText(
                                            data: AppString.wins,
                                            color: AppColor.greya,
                                            fontSize: 1.5.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ads
        AppContainer(
          onTap: () {},
          height: 6.5.h,
          color: AppColor.grey,
          child: const Center(
            child: CustomeText(
              title: AppString.ads,
              color: AppColor.background,
            ),
          ),
        ),
      ],
    );
  }
}
