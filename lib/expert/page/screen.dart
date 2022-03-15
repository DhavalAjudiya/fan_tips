import 'dart:io';
import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/commanText.dart';
import '../../widget/custom_container.dart';
import '../../utills/asset.dart';
import '../../utills/color.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import '../../widget/header_row.dart';
import '../T20Predictions/prediction.dart';
import 'prediction_container.dart';
import '../data/controller.dart';

class ExpertScreen extends StatelessWidget {
  static const routeName = "/ExpertScreen";
  IpController iplController = Get.put(IpController());

  ExpertScreen({Key? key}) : super(key: key);
  Future<void> _refresh() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    iplController.refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Are you sure want to exit?",
              style: TextStyle(
                fontFamily: "Circular",
                fontSize: 15.sp,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "No",
                  style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 15.sp,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.backgroundColorBlack,
          body: Padding(
            padding: EdgeInsets.only(
                top: 9.sp, left: 13.5.sp, right: 12.5.sp, bottom: 4.sp),
            child: Column(
              children: [
                HeaderRow(
                  title: AppString.predictionExpert,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(IconAsset.searchIcon),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                GestureDetector(
                  onTap: () {
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 0.2.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.3.h,
                                        ),
                                        Container(
                                          height: 0.2.h,
                                          width: 4.5.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.3.h,
                                        ),
                                        Container(
                                          height: 0.2.h,
                                          width: 2.5.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      AppString.sortBy,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'circular',
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
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
                                    itemCount: iplController.sort.value.length,
                                    itemBuilder: (context, index) {
                                      var data = iplController.sort[index];
                                      return Obx(
                                        () => ListTile(
                                          title: Text(
                                            data,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'circular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          trailing: ((iplController
                                                      .index.value ==
                                                  0)
                                              ? iplController
                                                          .selectedBottomSheetText
                                                          .value ==
                                                      iplController.sort[index]
                                                          .toString()
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(Icons.done,
                                                          size: 12),
                                                    )
                                                  : const Text("")
                                              : const Text("")),
                                          onTap: () {
                                            if (iplController.index.value ==
                                                0) {
                                              iplController
                                                      .selectedBottomSheetText
                                                      .value =
                                                  iplController.sort[index]
                                                      .toString();
                                            }
                                            if (kDebugMode) {
                                              print(iplController.sort[index]
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
                  child: Container(
                    height: 5.8.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.containerBackgroundColor,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 58.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 0.2.h,
                                width: 6.w,
                                decoration: BoxDecoration(
                                  color: AppColor.green,
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Container(
                                height: 0.2.h,
                                width: 4.5.w,
                                decoration: BoxDecoration(
                                  color: AppColor.green,
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Container(
                                height: 0.2.h,
                                width: 2.5.w,
                                decoration: BoxDecoration(
                                  color: AppColor.green,
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.sortByAvgScore,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontFamily: 'circular',
                                color: AppColor.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(
                              () => Text(
                                iplController.selectedBottomSheetText.value,
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColor.green,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(
                  () => Flexible(
                    child: SizedBox(
                      height: 79.h,
                      child: SmartRefresher(
                        onRefresh: _refresh,
                        controller: iplController.refreshController,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              iplController.expert.value.tipsters?.length ?? 0,
                          itemBuilder: (context, index) {
                            var postData =
                                iplController.expert.value.tipsters![index];
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  Get.toNamed(T20Prediction.routeName,
                                      arguments: {
                                        "image": postData.profileUrl ??
                                            "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                                        "title":
                                            '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                                        "prediction":
                                            "${postData.totalPredictions}",
                                        "averageScore": "${postData.avgScore}",
                                        "win": "${postData.top3}",
                                        "subscribers":
                                            "${postData.subscriberCount?.substring(0, 4)}",
                                      });
                                },
                                child: PredictionContainer(
                                  predictionCount:
                                      "${postData.totalPredictions}",
                                  onPressed: () {
                                    if (postData.wishlist.value == false) {
                                      postData.wishlist.value = true;
                                    } else {
                                      postData.wishlist.value = false;
                                    }
                                  },
                                  icon: postData.wishlist.value == false
                                      ? const Icon(Icons.favorite_border,
                                          color: AppColor.green)
                                      : const Icon(Icons.favorite,
                                          color: AppColor.green),
                                  winsCount: "${postData.top3}",
                                  youtubeText: "${postData.subscriberCount}",
                                  averageCount: "${postData.avgScore}",
                                  headerText:
                                      '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                                  backgroundImage: NetworkImage(postData
                                          .profileUrl ??
                                      "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
