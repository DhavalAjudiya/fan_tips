import 'dart:io';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/matches/widget/upcoming.dart';
import 'package:fantips/utills/string.dart';
import 'package:fantips/widget/google_sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../expert/data/controller.dart';
import '../../screen/ipl_screen/page/wight/container/container_custom.dart';
import '../../widget/profile_screen.dart';
import '../controler/matchs_controller.dart';
import '../widget/completed.dart';
import '../widget/live.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = "/home_screen";

  MatchesScreen({Key? key}) : super(key: key);
  final _homecontroller = Get.put(MatchsScreenControoler());
  final IpController ipController = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              AppString.next,
              style: TextStyle(
             //   fontFamily: AppString.circle,
                fontSize: 15.sp,
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppString.wk,
                  style: TextStyle(
            //        fontFamily: AppString.circle,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  AppString.news,
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
            padding: EdgeInsets.only(top: 5.sp, left: 5.sp, right: 8.sp),
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
                          showModalBottomSheet(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.w),
                                topLeft: Radius.circular(6.w),
                              ),
                            ),
                            context: context,
                            builder: (context) => Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        size: 9.w,
                                      ),
                                      splashColor: AppColor.transparent,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                                Image.asset(AppImage.logo, height: 40.w),
                                Padding(
                                  padding: EdgeInsets.all(5.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 0.2.h,
                                        width: 27.w,
                                        color: AppColor.grey,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const CustomeText(
                                          title: AppString.letsconnect),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        height: 0.2.h,
                                        width: 27.w,
                                        color: AppColor.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppContainer(
                                  height: 6.h,
                                  width: 60.w,
                                  color: AppColor.containerBackground,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    signInWithGoogle().then((data) {
                                      ipController.isLoggedIn.value = true;
                                      ipController.userObj = data;
                                    }).catchError((e) {});
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(AppImage.google, height: 8.w),
                                      const CustomeText(
                                        title: AppString.googleSign,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppContainer(
                                  height: 6.h,
                                  width: 60.w,
                                  color: AppColor.containerBackground,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(AppImage.fb, height: 8.w),
                                      const CustomeText(
                                        title: AppString.fbLogin,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
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
                // HeaderRow(
                //   title: AppString.title,
                // ),
                SizedBox(height: 2.h),
                TabBar(
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
                    controller: _homecontroller.tabController,
                    children: [
                      UpComing(),
                      Live(),
                      Completed(),
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
