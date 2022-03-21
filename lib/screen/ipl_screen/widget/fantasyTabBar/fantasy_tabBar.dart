import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/ipl_screen/controller/ipl_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../widget/custom_container.dart';

class FantasyTab extends StatelessWidget {
  final IplController iplController = Get.put(IplController());
  FantasyTab({Key? key}) : super(key: key);

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
                    () => Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                iplController.service.value.tipsters!.length,
                            itemBuilder: (context, index) {
                              var item =
                                  iplController.service.value.tipsters![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: AppContainer(
                                  onTap: () {},
                                  height: 14.h,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.greyBlack,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                item.profileUrl ?? "",
                                              ),
                                              radius: 3.h,
                                            ),
                                            SizedBox(width: 3.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 1.5.h,
                                                  width: 50.w,
                                                  child: CustomeText(
                                                    title: item.name ?? "",
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
                                                    SvgPicture.asset(
                                                      AppImage.youTub,
                                                      height: 1.2.h,
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    CustomeText(
                                                      title:
                                                          item.subscriberCount ??
                                                              "",
                                                      //"${_searchController.service!.tipsters![0].subscriberCount}",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 1.2.h,
                                                      color: AppColor.greya,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Obx(
                                              () => IconButton(
                                                onPressed: () {
                                                  if (item.selected.value ==
                                                      false) {
                                                    item.selected.value = true;
                                                  } else {
                                                    item.selected.value = false;
                                                  }
                                                },
                                                icon: item.selected.value ==
                                                        false
                                                    ? const Icon(
                                                        Icons.favorite_border,
                                                        color: AppColor.grey)
                                                    : const Icon(Icons.favorite,
                                                        color: AppColor.green),
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
                                                CustomeText(
                                                  title:
                                                      "${item.totalPredictions}",
                                                  color: AppColor.greya,
                                                  fontSize: 2.5.h,
                                                ),
                                                CustomeText(
                                                  title: AppString.prediction,
                                                  color: AppColor.greya,
                                                  fontSize: 1.3.h,
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
                                                CustomeText(
                                                  title: "${item.avgScore}",
                                                  color: AppColor.greya,
                                                  fontSize: 2.5.h,
                                                ),
                                                CustomeText(
                                                  title: AppString.avgScore,
                                                  color: AppColor.greya,
                                                  fontSize: 1.3.h,
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
                                                CustomeText(
                                                  title: "${item.top3}",
                                                  color: AppColor.greya,
                                                  fontSize: 2.5.h,
                                                ),
                                                CustomeText(
                                                  title: AppString.wins,
                                                  color: AppColor.greya,
                                                  fontSize: 1.3.h,
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
                      ],
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
