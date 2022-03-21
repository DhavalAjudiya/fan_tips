import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'dart:io';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/screen/more_screen/more_details_screen/apply_export_screen.dart';
import 'package:fantips/screen/more_screen/more_details_screen/contect_screen.dart';
import 'package:fantips/screen/more_screen/more_details_screen/favourite_experts.dart';
import 'package:fantips/screen/more_screen/more_details_screen/feedback_screen.dart';
import 'package:fantips/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Are you sure want to exit?",
              style: TextStyle(
                fontFamily: "Circular",
                fontSize: 15.sp,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "No",
                  style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 15.sp,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontFamily: "Circular",
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.backGround,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Text(
                    AppString.more,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 6.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomCard(
                  onTap: () {
                    Get.to(const ExpertsScreen());
                  },
                  text: AppString.experts,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomCard(
                  onTap: () {
                    showDialog(
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.white.withOpacity(0.8),
                            actions: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 5.5.h,
                                      width: 12.w,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: Center(
                                        child: Text(
                                          'FT',
                                          style: TextStyle(
                                              fontFamily: 'WorkSan',
                                              fontSize: 16.sp,
                                              color: AppColor.greenColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Enjoying FanTips',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'WorkSon'),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      spellOut: false,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 9.sp),
                                      children: [
                                        const TextSpan(
                                          text:
                                              'Tap a star to rate it on the App Store\n',
                                        ),
                                        TextSpan(
                                            text:
                                                '                    App Store',
                                            style: TextStyle(fontSize: 10.sp)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  RatingBarIndicator(
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    rating: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 25,
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const Divider(
                                    color: AppColor.backGround,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'Not Now',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.blueAccent,
                                        fontFamily: 'WorkSan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.3.h,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                        context: context);
                  },
                  text: AppString.rateUs,
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                CustomCard(
                  onTap: () {
                    Share.share(
                        "https://play.google.com/store/apps/details?id=fantasy.prediction.fantips");
                  },
                  text: AppString.share,
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                CustomCard(
                  onTap: () {
                    Get.to(FeedBackScreen());
                  },
                  text: AppString.feedBack,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                const CustomCard(
                  text: AppString.playGames,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                const CustomCard(
                  text: AppString.privacyPolicy,
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                const CustomCard(
                  text: AppString.copyRight,
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                const CustomCard(
                  text: AppString.termsUSe,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomCard(
                  onTap: () {
                    Get.to(ApplyExpertScreen());
                  },
                  text: AppString.applyExpert,
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                CustomCard(
                  onTap: () {
                    Get.to(ContactScreen());
                  },
                  text: AppString.contactFor,
                ),
                CustomCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return ScaleTransition(
                            scale: Tween<double>(begin: 0.1, end: 1).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.ease,
                              ),
                            ),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 1),
                        pageBuilder: (
                          BuildContext context,
                          Animation<double> aninamtion,
                          Animation<double> secondaryAnimation,
                        ) {
                          return ContactScreen();
                        },
                      ),
                    );
                  },
                  text: AppString.contactFor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
