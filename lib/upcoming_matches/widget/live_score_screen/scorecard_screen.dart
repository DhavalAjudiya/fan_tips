import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/widget/bowler_table.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/widget/custom_score_card.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/widget/falls_wickets.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/widget/table_batsman.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../T20Predictions/page/utills/asset.dart';
import '../../../utills/style.dart';

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            const CustomScoreCard(
              imageLogo1: IconAsset.logoMI,
              imageLogo2: IconAsset.logoCSK,
            ),
            SizedBox(
              height: 3.h,
            ),
            ExpansionTile(
              collapsedBackgroundColor: AppColor.greyBackGround,
              backgroundColor: AppColor.backGround,
              title: Text(
                'Chennai Super king',
                style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              trailing: Text(
                '159-9(20.0)',
                style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// BATSMAN
                    TableBatsMan(),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 4.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EXTRAS'),
                          RichText(
                            text: TextSpan(children: [TextSpan(text: '4'), TextSpan(text: '(b,0,lb,0,w,6,nb,2)', style: Appstyle.pointSub)]),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: TextStyle(color: AppColor.white, fontSize: 14.sp)),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: AppColor.white, fontSize: 14.sp),
                              children: [
                                TextSpan(text: '110/3'),
                                TextSpan(text: '(20)', style: Appstyle.pointSub),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 6.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Column(
                          children: [
                            Align(
                              child: Text(
                                'Yet to Bat',
                                style: Appstyle.pointSub,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text(
                                'Hardik , Pollard , Bumrahs',
                                style: Appstyle.pointSub,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    /// Bowler
                    BowlerTable(),

                    SizedBox(
                      height: 2.h,
                    ),

                    /// Falls of Wickets
                    FallWicket(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            ExpansionTile(
              collapsedBackgroundColor: AppColor.greyBackGround,
              backgroundColor: AppColor.backGround,
              title: Text(
                'Mumbai Indians',
                style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              trailing: Text(
                '159-9(20.0)',
                style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// BATSMAN
                    TableBatsMan(),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 4.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EXTRAS'),
                          RichText(
                            text: TextSpan(children: [TextSpan(text: '4'), TextSpan(text: '(b,0,lb,0,w,6,nb,2)', style: Appstyle.pointSub)]),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: TextStyle(color: AppColor.white, fontSize: 14.sp)),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: AppColor.white, fontSize: 14.sp),
                              children: [
                                TextSpan(text: '110/3'),
                                TextSpan(text: '(20)', style: Appstyle.pointSub),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.greyBackGround,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 6.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Column(
                          children: [
                            Align(
                              child: Text(
                                'Yet to Bat',
                                style: Appstyle.pointSub,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text(
                                'Hardik , Pollard , Bumrahs',
                                style: Appstyle.pointSub,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    /// Bowler
                    BowlerTable(),

                    SizedBox(
                      height: 2.h,
                    ),

                    /// Falls of Wickets
                    FallWicket(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
