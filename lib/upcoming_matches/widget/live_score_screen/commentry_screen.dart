import 'dart:math';

import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/widget/custom_score_card.dart';
import 'package:fantips/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../matches/controler/matchs_controller.dart';

class Commentary extends StatelessWidget {
  Commentary({Key? key}) : super(key: key);

  final MatchsScreenControoler matchScreenController =
      Get.put(MatchsScreenControoler());
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          CustomScoreCard(
            imageLogo1: IconAsset.logoMI,
            imageLogo2: IconAsset.logoCSK,
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 8.h,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('20.0'),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CircleAvatar(
                                  minRadius: 1.7.h,
                                  backgroundColor: Colors.primaries[_random
                                          .nextInt(Colors.primaries.length)]
                                      [_random.nextInt(9) * 100],
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pollard to Deepak Cahhar',
                                  style: Appstyle.subIplStyle,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  '1 run',
                                  style: Appstyle.subIplStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
