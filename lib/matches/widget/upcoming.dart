import 'package:fantips/matches/controler/utils_time.dart';
import 'package:fantips/matches/widget/upcoming_matches/page/upcoming_match_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
          height: 1.5.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                _homecontroller.currentMatch.value.matches?.notstarted?.length,
            itemBuilder: (context, index) {
              final current = _homecontroller
                  .currentMatch.value.matches?.notstarted?[index];
              return Obx(
                () => _homecontroller.loading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : InkWell(
                        onTap: () {
                          Get.toNamed(
                            UpcomingMatchScreen.routeName,
                            arguments: {
                              "t1img":
                                  current?.t1Flag ?? AppString.imageNotFound,
                              "t2img":
                                  current?.t2Flag ?? AppString.imageNotFound,
                              "t1name": current?.team1Name ?? "",
                              "t2name": current?.team2Name ?? "",
                              "time": Utils.timeAgoSinceDate(
                                  current?.startTime ?? 0),
                            },
                          );
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
                            CustomContainer(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              headertext: current?.matchName ?? "",
                              ontap: () {
                                if (current?.selected.value == false) {
                                  current?.selected.value = true;
                                } else {
                                  current?.selected.value = false;
                                }
                              },
                              icon: current?.selected.value == true
                                  ? const Icon(Icons.notifications)
                                  : const Icon(Icons.notifications_none),
                              backgroundImage: NetworkImage(
                                current?.t1Flag ??
                                    "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                              ),
                              text: current?.team1Name ?? "",
                              secondbackgroundImage: NetworkImage(
                                current?.t2Flag ??
                                    "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                              ),
                              subText: current?.team2Name ?? "",
                              predictionText:
                                  "${current?.totalprediction ?? ""}",
                              prediction: "Prediction",
                              lastText:
                                  "Match Start in ${Utils.timeAgoSinceDate(current?.startTime ?? 0)}",
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
