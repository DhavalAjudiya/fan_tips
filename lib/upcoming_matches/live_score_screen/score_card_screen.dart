import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../T20Predictions/page/utills/asset.dart';
import '../../../matches/widget/upcoming_matches/widget/custom_score_card.dart';
import '../../../utills/style.dart';
import 'widget/bowler_table.dart';
import 'widget/falls_wickets.dart';
import 'widget/table_batsman.dart';

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

            // 1
            ExpansionTile(
              collapsedBackgroundColor: AppColor.greyBackGround,
              backgroundColor: AppColor.backGround,
              title: Row(
                children: [
                  Text(
                    'Chennai Super king',
                    style: Appstyle.scoreTitle,
                  ),
                  Spacer(),
                  Text(
                    '159-9(20.0)',
                    style: Appstyle.scoreTitle,
                  ),
                ],
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TableBatsMan(),
                    _divider(),
                    SizedBox(
                      width: 100.w,
                      height: 4.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EXTRAS'),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(text: '4'),
                              TextSpan(
                                  text: '(b,0,lb,0,w,6,nb,2)',
                                  style: Appstyle.pointSub)
                            ]),
                          )
                        ],
                      ),
                    ),
                    _divider(),
                    SizedBox(
                      width: 100.w,
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 14.sp)),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 14.sp),
                              children: [
                                TextSpan(text: '110/3'),
                                TextSpan(
                                    text: '(20)', style: Appstyle.pointSub),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _divider(),
                    _yetToBat(),
                    SizedBox(
                      height: 2.h,
                    ),
                    BowlerTable(),
                    SizedBox(
                      height: 2.h,
                    ),
                    FallWicket(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            // 2
            ExpansionTile(
              collapsedBackgroundColor: AppColor.greyBackGround,
              backgroundColor: AppColor.backGround,
              title: Row(
                children: [
                  Text(
                    'Mumbai Indians',
                    style: Appstyle.scoreTitle,
                  ),
                  Spacer(),
                  Text(
                    '159-9(20.0)',
                    style: Appstyle.scoreTitle,
                  ),
                ],
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TableBatsMan(),
                    _divider(),
                    SizedBox(
                      width: 100.w,
                      height: 4.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EXTRAS'),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: '4'),
                                TextSpan(
                                  text: '(b,0,lb,0,w,6,nb,2)',
                                  style: Appstyle.pointSub,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _divider(),
                    SizedBox(
                      width: 100.w,
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 14.sp)),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 14.sp),
                              children: [
                                TextSpan(text: '110/3'),
                                TextSpan(
                                    text: '(20)', style: Appstyle.pointSub),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _divider(),
                    _yetToBat(),
                    SizedBox(
                      height: 2.h,
                    ),
                    BowlerTable(),
                    SizedBox(
                      height: 2.h,
                    ),
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

  Widget _divider() {
    return const Divider(
      color: AppColor.greyBackGround,
      height: 1,
      thickness: 1,
    );
  }

  Widget _yetToBat() {
    return SizedBox(
      height: 7.h,
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
    );
  }
}
