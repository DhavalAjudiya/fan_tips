import 'dart:io';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/matches/widget/upcoming.dart';
import 'package:fantips/utills/string.dart';
import 'package:fantips/widget/app_bottom_sheet.dart';
import 'package:fantips/widget/google_sign_in_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../expert/data/controller.dart';
import '../../screen/ipl_screen/widget/fantasyTabBar/wight/container/container_custom.dart';
import '../../widget/header_row.dart';
import '../../widget/profile_screen.dart';
import '../../utills/string.dart';
import '../../widget/google_sign_in_repo.dart';
import '../controler/matchs_controller.dart';
import '../widget/completed.dart';
import '../widget/live.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = "/home_screen";

  MatchesScreen({Key? key}) : super(key: key);
  final _homecontroller = Get.put(MatchsScreenControoler());
  final IpController ipController = Get.find();
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
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
                //   fontFamily: AppString.circle,
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
                    //        fontFamily: AppString.circle,
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
                    //         fontFamily: AppString.circle,
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.only(top: 10.sp, left: 8.sp, right: 8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomeText(
                      title: AppString.title,
                      color: AppColor.whiteColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    const Spacer(),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          AppBottomSheet().bottomSheet(context);
                        },
                        child: ipController.isLoggedIn.value == false
                            ? CustomeText(
                                title: AppString.login,
                                color: AppColor.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                              )
                            : GestureDetector(
                                onTap: () {
                                  Get.to(ProfileScreen());
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColor.transparent,
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      "${ipController.userObj?.user?.photoURL}"),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                TabBar(
                  automaticIndicatorColorAdjustment: true,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.only(right: 10),
                  unselectedLabelColor: Colors.white,
                  isScrollable: true,
                  indicatorColor: Colors.green,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.green,
                  controller: _homecontroller.tabController,
                  tabs: [
                    Tab(
                      child: CustomeText(
                        title: AppString.upcoming,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Tab(
                      child: CustomeText(
                        title: AppString.live,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Tab(
                      child: CustomeText(
                        title: AppString.completed,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    dragStartBehavior: dragStartBehavior,
                    controller: _homecontroller.tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: UpComing(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Live(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Completed(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
