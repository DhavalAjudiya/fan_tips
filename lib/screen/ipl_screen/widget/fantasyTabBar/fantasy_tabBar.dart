import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/screen/ipl_screen/controller/ipl_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          AppContainer(
            height: 12.h,
            color: AppColor.blackColor,
            borderRadius: BorderRadius.circular(10.sp),
            child: Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18.sp,
                    backgroundImage: AssetImage(AppImage.ind),
                  ),
                  SizedBox(width: 1.5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomeText(
                        title: "IND",
                        color: AppColor.textColor,
                        fontSize: 1.8.h,
                      ),
                      CustomeText(
                        title: "135-7 & 135-7",
                        fontSize: 1.8.h,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.flash_on,
                    size: 2.5.h,
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomeText(
                        title: "ZIM",
                        color: AppColor.textColor,
                        fontSize: 1.8.h,
                      ),
                      CustomeText(
                        title: "120-5 & 120-5",
                        fontSize: 1.8.h,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 1.5.w),
                  CircleAvatar(
                    radius: 18.sp,
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
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (iplController.isSelect = true) {
                              iplController.select.value = 0;
                            } else {
                              iplController.isSelect = false;
                            }

                            showModalBottomSheet(
                              backgroundColor:
                                  AppColor.containerBackgroundColor,
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
                                              "assets/image/line.svg",
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
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Divider(
                                              height: 0,
                                              color: AppColor.verticalDivider,
                                            ),
                                            itemCount: iplController
                                                .titleScore.value.length,
                                            itemBuilder: (context, index) {
                                              var data = iplController
                                                  .titleScore[index];
                                              return Obx(
                                                () => ListTile(
                                                  title: CustomeText(
                                                    title: data,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  trailing: ((iplController
                                                              .index.value ==
                                                          0)
                                                      ? iplController
                                                                  .selectedBottomSheetText
                                                                  .value ==
                                                              iplController
                                                                  .titleScore[
                                                                      index]
                                                                  .toString()
                                                          ? const CircleAvatar(
                                                              radius: 8,
                                                              backgroundColor:
                                                                  AppColor
                                                                      .white,
                                                              child: Icon(
                                                                  Icons.done,
                                                                  size: 12),
                                                            )
                                                          : const Text("")
                                                      : const Text("")),
                                                  onTap: () {
                                                    if (iplController
                                                            .index.value ==
                                                        0) {
                                                      iplController
                                                              .selectedBottomSheetText
                                                              .value =
                                                          iplController
                                                              .titleScore[index]
                                                              .toString();
                                                    }
                                                    if (kDebugMode) {
                                                      print(iplController
                                                          .titleScore[index]
                                                          .toString());
                                                    }
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
                                  "assets/image/line.svg",
                                  height: 1.7.h,
                                  color: iplController.select.value == 0
                                      ? AppColor.greenColor
                                      : AppColor.textColor,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                CustomeText(
                                  title: AppString.avgScore,
                                  color: iplController.select.value == 0
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
                            if (iplController.isSelect = true) {
                              iplController.select.value = 1;
                            } else {
                              iplController.isSelect = false;
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
                                  color: iplController.select.value == 1
                                      ? AppColor.greenColor
                                      : AppColor.textColor,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                CustomeText(
                                  title: AppString.favourites,
                                  color: iplController.select.value == 1
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
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount:
                  //         iplController.service.value.tipsters!.length,
                  //     itemBuilder: (context, index) {
                  //       var item =
                  //           iplController.service.value.tipsters![index];
                  //       return Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 20, vertical: 10),
                  //         child: AppContainer(
                  //           onTap: () {},
                  //           height: 17.h,
                  //           width: double.infinity,
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: AppColor.greyBlack,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(10),
                  //             child: Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     CircleAvatar(
                  //                       backgroundImage: NetworkImage(
                  //                         item.profileUrl ?? "",
                  //                       ),
                  //                       radius: 3.2.h,
                  //                     ),
                  //                     SizedBox(width: 3.w),
                  //                     Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Container(
                  //                           height: 1.5.h,
                  //                           width: 50.w,
                  //                           child: CustomeText(
                  //                             title: item.name ?? "",
                  //                             // "${_searchController.service!.tipsters![0].name}",
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 1.5.h,
                  //                             color: AppColor.white,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 0.5.h,
                  //                         ),
                  //                         Row(
                  //                           children: [
                  //                             Image(
                  //                               image: const AssetImage(
                  //                                 AppImage.sign,
                  //                               ),
                  //                               height: 1.3.h,
                  //                             ),
                  //                             SizedBox(
                  //                               width: 1.w,
                  //                             ),
                  //                             CustomeText(
                  //                               title:
                  //                                   item.subscriberCount ??
                  //                                       "",
                  //                               //"${_searchController.service!.tipsters![0].subscriberCount}",
                  //                               fontWeight:
                  //                                   FontWeight.bold,
                  //                               fontSize: 1.2.h,
                  //                               color: AppColor.greya,
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Spacer(),
                  //                     Obx(
                  //                       () => IconButton(
                  //                         onPressed: () {
                  //                           iplController
                  //                                   .service
                  //                                   .value
                  //                                   .tipsters![index]
                  //                                   .selected
                  //                                   .value =
                  //                               !iplController
                  //                                   .service
                  //                                   .value
                  //                                   .tipsters![index]
                  //                                   .selected
                  //                                   .value;
                  //                         },
                  //                         color: iplController
                  //                                 .service
                  //                                 .value
                  //                                 .tipsters![index]
                  //                                 .selected
                  //                                 .value
                  //                             ? AppColor.grey
                  //                             : AppColor.green,
                  //                         icon: Icon(Icons.favorite),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceAround,
                  //                   children: [
                  //                     Column(
                  //                       children: [
                  //                         CustomeText(
                  //                           title:
                  //                               "${item.totalPredictions}",
                  //                           color: AppColor.greya,
                  //                           fontSize: 3.h,
                  //                         ),
                  //                         CustomeText(
                  //                           title: AppString.prediction,
                  //                           color: AppColor.greya,
                  //                           fontSize: 1.5.h,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     AppContainer(
                  //                       height: 5.h,
                  //                       width: 0.1.w,
                  //                       color: AppColor.grey,
                  //                     ),
                  //                     Column(
                  //                       children: [
                  //                         CustomeText(
                  //                           title: "${item.avgScore}",
                  //                           color: AppColor.greya,
                  //                           fontSize: 3.h,
                  //                         ),
                  //                         CustomeText(
                  //                           title: AppString.avregescor,
                  //                           color: AppColor.greya,
                  //                           fontSize: 1.5.h,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     AppContainer(
                  //                       height: 5.h,
                  //                       width: 0.1.w,
                  //                       color: AppColor.grey,
                  //                     ),
                  //                     Column(
                  //                       children: [
                  //                         CustomeText(
                  //                           title: "${item.top3}",
                  //                           color: AppColor.greya,
                  //                           fontSize: 3.h,
                  //                         ),
                  //                         CustomeText(
                  //                           title: AppString.wins,
                  //                           color: AppColor.greya,
                  //                           fontSize: 1.5.h,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
