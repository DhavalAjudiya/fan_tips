import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../upcoming_matches/widget/live_score_screen/live_score_screen.dart';
import '../../utills/string.dart';
import '../../widget/current_match_container.dart';
import '../controler/matchs_controller.dart';

class Completed extends StatelessWidget {
  final _homecontroller = Get.put(MatchsScreenControoler());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _homecontroller
                .completedMatches.value.matches?.completed?.length,
            itemBuilder: (context, index) {
              final current = _homecontroller
                  .completedMatches.value.matches?.completed?[index];
              return Obx(() {
                if (_homecontroller.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GestureDetector(
                    onTap: () {
                      Get.to(LiveScoreScreen());
                    },
                    child: Column(
                      children: [
                        // Text(
                        //   _homecontroller.timeAgo(current?.startTime ?? 0),
                        //   style: const TextStyle(
                        //     color: Colors.white54,
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        CustomLCContainer(
                          margin: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 2.w),
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
                          t1wk: "${current?.i2Details?.wk ?? ""}",
                          t1over: "${current?.i4Details?.run ?? ""}",
                          t1owk: "${current?.i4Details?.wk ?? ""}",
                          t2run: "${current?.i1Details?.run ?? ""}",
                          t2wk: "${current?.i1Details?.wk ?? ""}",
                          t2over: "${current?.i3Details?.run ?? ""}",
                          t2owk: "${current?.i3Details?.wk ?? ""}",
                          predictionText: "${current?.totalprediction ?? ""}",
                          prediction: "Prediction",
                          lastText: current?.infoMsg ?? "",
                        ),
                      ],
                    ),
                  );
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
