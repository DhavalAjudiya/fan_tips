import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../upcoming_matches/live_score_screen/live_score_screen.dart';
import '../../utills/string.dart';
import '../../widget/current_match_container.dart';
import '../controler/matchs_controller.dart';
import '../controler/utils_time.dart';

class Completed extends StatelessWidget {
  final _homeController = Get.put(MatchesScreenController());
  String matchTime = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Expanded(
          child: ListView.builder(
            controller: _homeController.scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: _homeController.data.length,
            itemBuilder: (context, index) {
              final current = _homeController.data[index];
              final backTime = index == 0
                  ? _homeController.data[index]
                  : _homeController.data[(index - 1)];
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    Get.to(LiveScoreScreen());
                  },
                  child: Column(
                    children: [
                      Utils.formatTimeOfDay(current?.startTime ?? 0) ==
                                  Utils.formatTimeOfDay(
                                      backTime?.startTime ?? 0) ||
                              index == 0
                          ? SizedBox(
                              height: 1.7.h,
                            )
                          : Text(
                              Utils.formatTimeOfDay(current?.startTime ?? 0),
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      CustomLCContainer(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        headertext: current?.header ?? "",
                        ontap: () {
                          if (current?.isSelect.value == false) {
                            current?.isSelect.value = true;
                          } else {
                            current?.isSelect.value = false;
                          }
                        },
                        icon: current?.isSelect.value == true
                            ? const Icon(Icons.notifications)
                            : const Icon(Icons.notifications_none),
                        backgroundImage: NetworkImage(
                          current?.t1Flag ?? AppString.imageNotFound,
                        ),
                        text: current?.team1Name ?? "",
                        secondbackgroundImage: NetworkImage(
                          current?.t2Flag ?? AppString.imageNotFound,
                        ),
                        subText: current?.team2Name ?? "",
                        t1run: "${current?.i2Details?.run ?? ""}",
                        t1wk: current?.i2Details?.wk == 10 ||
                                current?.i2Details?.wk == 0
                            ? ""
                            : "/${current?.i2Details?.wk ?? ""}",
                        t1over: current?.type == 1
                            ? current?.i4Details?.run == 0
                                ? ""
                                : "& ${current?.i4Details?.run ?? ""}"
                            : "(${current?.i2Details?.over ?? ""})",
                        overstyle: current?.type == 1
                            ? TextStyle(
                                color: Colors.white,
                                fontFamily: "circular",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)
                            : TextStyle(
                                color: Colors.white30,
                                fontFamily: "circular",
                                fontSize: 9.sp,
                              ),
                        t1owk: current?.type == 1
                            ? current?.i4Details?.wk == 10 ||
                                    current?.i4Details?.wk == 0
                                ? ""
                                : "/${current?.i4Details?.wk ?? ""}"
                            : "",
                        t2run: "${current?.i1Details?.run ?? ""}",
                        t2wk: current?.i1Details?.wk == 10 ||
                                current?.i1Details?.wk == 0
                            ? ""
                            : "/${current?.i1Details?.wk ?? ""}",
                        t2over: current?.type == 1
                            ? current?.i4Details?.run == 0
                                ? ""
                                : "& ${current?.i3Details?.run ?? ""}"
                            : "(${current?.i1Details?.over ?? ""})",
                        over2style: current?.type == 1
                            ? TextStyle(
                                color: Colors.white,
                                fontFamily: "circular",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)
                            : TextStyle(
                                color: Colors.white30,
                                fontFamily: "circular",
                                fontSize: 9.sp,
                              ),
                        t2owk: current?.type == 1
                            ? current?.i3Details?.wk == 10 ||
                                    current?.i3Details?.wk == 0
                                ? ""
                                : "/${current?.i3Details?.wk ?? ""}"
                            : "",
                        // t2over: "(${current?.i1Details?.over ?? ""})",
                        // t2owk: "${current?.i3Details?.wk ?? ""}",
                        predictionText: current?.totalprediction != 0
                            ? "${current?.totalprediction ?? ""}"
                            : "Start At",
                        style: current?.totalprediction != 0
                            ? TextStyle(
                                color: Colors.green,
                                fontFamily: "circular",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: Colors.white,
                                fontFamily: "circular",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                        prediction: current?.totalprediction != 0
                            ? "${"Prediction"}"
                            : "${Utils.hourAndMin(current?.startTime ?? 0)}",
                        pstyle: current?.totalprediction != 0
                            ? TextStyle(
                                color: Colors.green,
                                fontFamily: "circular",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: Colors.white,
                                fontFamily: "circular",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                        lastText: current?.infoMsg ?? "",
                      ),
                      // ignore: invalid_use_of_protected_member
                      _homeController.data.value.length - 1 == index
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
