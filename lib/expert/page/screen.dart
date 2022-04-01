import 'dart:io';
import 'package:fantips/expert/page/search_screen.dart';
import 'package:fantips/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/commanText.dart';
import '../../utills/string.dart';
import '../T20Predictions/prediction.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../widget/header_row.dart';
import 'prediction_container.dart';
import '../data/controller.dart';

class ExpertScreen extends StatefulWidget {
  static const routeName = "/ExpertScreen";

  ExpertScreen({Key? key}) : super(key: key);

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  IpController ipController = Get.put(IpController());

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
              // ignore: deprecated_member_use
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
              // ignore: deprecated_member_use
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
            child: Obx(
              () {
                print(ipController.expert.value.tipsters?.length);
                return Column(
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
                        child: SvgPicture.asset(
                          IconAsset.searchIcon,
                          height: 18,
                        ),
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
                              height: 25.h,
                              color: AppColor.containerBackgroundColor,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, right: 10.sp, top: 10.sp),
                                child: Obx(
                                  () {
                                    print(ipController.expertData.length);
                                    return Column(
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
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (ipController.isBottomSelect =
                                                true) {
                                              ipController.index.value = 0;
                                              print("prediction==>>>");
                                              ipController.expertData.sort(
                                                (a, b) => a.totalPredictions!
                                                    .compareTo(
                                                  b.totalPredictions!,
                                                ),
                                              );
                                              setState(() {});
                                            } else {
                                              ipController.isBottomSelect =
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
                                              ipController.index.value == 0
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
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (ipController.isBottomSelect =
                                                true) {
                                              ipController.index.value = 1;
                                              print("avgScore==>>>");
                                              ipController.expertData.sort(
                                                  (a, b) => a.avgScore!
                                                      .compareTo(b.avgScore!));
                                              setState(() {});
                                            } else {
                                              ipController.isBottomSelect =
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
                                              ipController.index.value == 1
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(
                                                        Icons.done,
                                                        size: 12,
                                                      ),
                                                    )
                                                  : const CustomeText(
                                                      title: "",
                                                    )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (ipController.isBottomSelect =
                                                true) {
                                              ipController.index.value = 2;
                                              print("wins==>>>");
                                              ipController.expertData.sort((a,
                                                      b) =>
                                                  a.top3!.compareTo(b.top3!));
                                              setState(() {});
                                            } else {
                                              ipController.isBottomSelect =
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
                                              ipController.index.value == 2
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor:
                                                          AppColor.white,
                                                      child: Icon(Icons.done,
                                                          size: 12),
                                                    )
                                                  : const CustomeText(
                                                      title: ""),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
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
                                      color: AppColor.green,
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
                                      color: AppColor.green,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
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
                                    fontSize: 13.sp,
                                    fontFamily: 'circular',
                                    color: AppColor.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Obx(
                                  () => CustomeText(
                                    title: ipController.index.value == 0
                                        ? AppString.prediction
                                        : ipController.index.value == 1
                                            ? AppString.average_score
                                            : ipController.index.value == 2
                                                ? AppString.wins
                                                : "",
                                    color: AppColor.greenColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                )
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
                      () {
                        print(ipController.isLoggedIn.value);
                        return Flexible(
                          child: SizedBox(
                            height: 79.h,
                            child: SmartRefresher(
                              onRefresh: ipController.refresh,
                              controller: ipController.refreshController,
                              child: ListView.builder(
                                controller: ipController.scrollController,
                                physics: const BouncingScrollPhysics(),
                                itemCount: ipController.isLoading.value
                                    ? ipController.expertData.length + 1
                                    : ipController.expertData.length,
                                itemBuilder: (context, index) {
                                  var postData = ipController.expertData[index];
                                  return (ipController.expertData.length - 1 ==
                                          index)
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 30, top: 10),
                                          child: Center(
                                              child: SpinKitCircle(
                                            color: AppColor.white,
                                            size: 3.h,
                                          )),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              T20Prediction.routeName,
                                              arguments: {
                                                "img": postData.profileUrl ??
                                                    "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                                                "text": "${postData.name}",
                                                "subtext":
                                                    "${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...",
                                                "prediction":
                                                    "${postData.totalPredictions}",
                                                "avgScore":
                                                    "${postData.avgScore}",
                                                "win": "${postData.top3}",
                                                "subscribers":
                                                    "${postData.subscriberCount?.substring(0, 4)}",
                                              },
                                            );
                                          },
                                          child: PredictionContainer(
                                            predictionCount:
                                                "${postData.totalPredictions}",
                                            onPressed: () {
                                              if (ipController.isLoggedIn ==
                                                  false) {
                                                AppBottomSheet()
                                                    .bottomSheet(context);
                                              } else {
                                                postData.wishlist.value == false
                                                    ? const Icon(
                                                        Icons.favorite_border,
                                                        color: AppColor.green,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: AppColor.green,
                                                      );
                                                setState(() {});
                                              }
                                              if (postData.wishlist.value ==
                                                  false) {
                                                postData.wishlist.value = true;
                                              } else {
                                                postData.wishlist.value = false;
                                              }
                                            },
                                            icon:
                                                postData.wishlist.value == false
                                                    ? const Icon(
                                                        Icons.favorite_border,
                                                        color: AppColor.green,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: AppColor.green,
                                                      ),
                                            winsCount: "${postData.top3 ?? ""}",
                                            youtubeText:
                                                "${postData.subscriberCount ?? ""}",
                                            averageCount:
                                                "${postData.avgScore ?? ""}",
                                            headerText:
                                                '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                                            backgroundImage: NetworkImage(
                                              postData.profileUrl ??
                                                  "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
