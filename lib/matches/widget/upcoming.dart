import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/matches/widget/upcoming_matches/page/upcoming_match_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/commanText.dart';
import '../../utills/string.dart';
import '../../widget/current_match_container.dart';
import '../controler/matchs_controller.dart';

class UpComing extends StatelessWidget {
  final _homecontroller = Get.put(MatchsScreenControoler());

  UpComing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        CustomeText(
          title: AppString.tomorrow,
          color: AppColor.whiteColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w900,
        ),
        SizedBox(
          height: 1.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                _homecontroller.currentMatch.value.matches?.notstarted?.length,
            itemBuilder: (context, index) {
              final current = _homecontroller.currentMatch.value.matches?.notstarted?[index];
              return Obx(
                () => CustomContainer(

                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  headertext: current?.matchName ?? "",
                  ontap: () {
                    if (current?.selected.value == false) {
                      current?.selected.value = true;
                    } else {
                      current?.selected.value = false;
                    }
                  },
                  icon: current?.selected.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none),
                  backgroundImage: NetworkImage(
                    current?.t1Flag ?? AppString.imageNotFound,
                  ),
                  text: current?.team1Name ?? "",
                  secondbackgroundImage: NetworkImage(
                    current?.t2Flag ?? AppString.imageNotFound,
                  ),
                  subText: current?.team2Name ?? "",
                  predictionText: "${current?.totalprediction ?? ""}",
                  prediction: "Prediction",
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
