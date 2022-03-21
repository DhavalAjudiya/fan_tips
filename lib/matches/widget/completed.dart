import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/matches/controler/utils_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
                  return Column(
                    children: [
                      Text(
                        _homecontroller
                            .timeAgo(_homecontroller.time(current?.startTime)),
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                        icon: current?.isSelect.value == false
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
                        // t1run: "${current?.t1Run ?? ""}",
                        // t1wk: "${current?.t1Wk ?? ""}",
                        // t1over: current?.t1Over ?? "",
                        // t2run: "${current?.t2Run ?? ""}",
                        // t2wk: "${current?.t2Wk ?? ""}",
                        // t2over: current?.t2Over ?? "",
                        predictionText: "${current?.totalprediction ?? ""}",
                        prediction: "Prediction",
                        lastText: current?.infoMsg ?? "",
                      ),
                    ],
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
