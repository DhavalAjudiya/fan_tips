import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/expert/T20Predictions/prediction_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../../widget/current_match_container.dart';

class MatchesPage extends StatelessWidget {
  MatchesPage({Key? key}) : super(key: key);
  final PredictionController _predictionController =
      Get.put(PredictionController());
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _predictionController
              .currentMatch.value.matches?.completed?.length,
          itemBuilder: (context, index) {
            final current = _predictionController
                .currentMatch.value.matches?.completed?[index];
            return CustomLCContainer(
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              headertext: current?.matchName ?? "",
              ontap: () {
                // if (_predictionController.selected.value == false) {
                //   _predictionController.selected.value == true;
                // } else {
                //   _predictionController.selected.value == false;
                // }
              },
              icon: SvgPicture.asset(IconAsset.warning),
              backgroundImage: NetworkImage(
                current?.t1Flag ?? AppString.imageNotFound,
              ),
              text: current?.team1Name ?? "",
              secondbackgroundImage: NetworkImage(
                current?.t2Flag ?? AppString.imageNotFound,
              ),
              subText: current?.team2Name ?? "",
              t1run: "${current?.t1Run ?? ""}",
              t1wk: "${current?.t1Wk ?? ""}",
              t1over: current?.t1Over ?? "",
              t2run: "${current?.t2Run ?? ""}",
              t2wk: "${current?.t2Wk ?? ""}",
              t2over: current?.t2Over ?? "",
              predictionText: "${current?.totalprediction ?? ""}",
              prediction: "Prediction",
              lastText: current?.infoMsg ?? "",
              // _predictionController.timeAgo(current?.startTime ?? 0),
              person: Icons.supervisor_account, size: 2.5.h,

              team: AppString.team,
            );
          },
        ),
      ),
    );
  }
}
