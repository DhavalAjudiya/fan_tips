import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/string.dart';
import '../../widget/current_match_container.dart';
import '../controler/matchs_controller.dart';

class Live extends StatelessWidget {
  final _homecontroller = Get.put(MatchsScreenControoler());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                _homecontroller.liveMatches.value.matches?.started?.length,
            itemBuilder: (context, index) {
              final current =
                  _homecontroller.liveMatches.value.matches?.started?[index];

              return Obx(
                () => CustomLCContainer(
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  headertext: current?.matchName ?? "",
                  ontap: () {
                    if (current?.isSelected.value == false) {
                      current?.isSelected.value = true;
                    } else {
                      current?.isSelected.value = false;
                    }
                  },
                  icon: current?.isSelected.value == false
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
                  lastText: AppString.live,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
