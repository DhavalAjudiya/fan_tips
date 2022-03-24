import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../upcoming_matches/live_score_screen/live_score_screen.dart';
import '../../utills/string.dart';
import '../../widget/current_match_container.dart';
import '../controler/matchs_controller.dart';
import '../controler/utils_time.dart';

class Completed extends StatelessWidget {
  final _homecontroller = Get.put(MatchsScreenControoler());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _homecontroller
                .completedMatches.value.matches?.completed?.length,
            itemBuilder: (context, index) {
              final current = _homecontroller
                  .completedMatches.value.matches?.completed?[index];
              return Obx(
                () => _homecontroller.loading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.to(LiveScoreScreen());
                        },
                        child: Column(
                          children: [
                            Text(
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
                              t1wk: current?.i2Details?.wk == 10
                                  ? ""
                                  : "/${current?.i2Details?.wk ?? ""}",
                              t1over: "(${current?.i2Details?.over ?? ""})",
                              // t1owk: "${current?.i4Details?.wk ?? ""}",
                              t2run: "${current?.i1Details?.run ?? ""}",
                              t2wk: current?.i1Details?.wk == 10
                                  ? ""
                                  : "/${current?.i1Details?.wk ?? ""}",
                              t2over: "(${current?.i1Details?.over ?? ""})",
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
