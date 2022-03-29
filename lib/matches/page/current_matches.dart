import 'dart:io';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/matches/widget/upcoming.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../expert/data/controller.dart';
import '../../screen/ipl_screen/fantasyTabBar/widget/wight/container/container_custom.dart';
import '../../widget/google_sign_in_repo.dart';
import '../../widget/profile_screen.dart';
import '../../utills/string.dart';
import '../controler/matchs_controller.dart';
import '../widget/completed.dart';
import '../widget/live.dart';

// ignore: must_be_immutable
class MatchesScreen extends StatefulWidget {
  static const routeName = "/home_screen";

  MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final _homeController = Get.put(MatchesScreenController());

  final IpController ipController = Get.find();

  bool login = false;

  Map User = {};

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
              // ignore: deprecated_member_use
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
              // ignore: deprecated_member_use
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6.w),
                              topLeft: Radius.circular(6.w),
                            ),
                          ),
                          context: context,
                          builder: (context) => Container(
                            height: 80.h,
                            child: Column(
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
                                Image.asset(AppImage.logo, height: 30.w),
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
                                      CustomeText(title: AppString.letsconnect),
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
                                  height: 10.h,
                                ),
                                AppContainer(
                                  height: 6.h,
                                  width: 60.w,
                                  color: AppColor.containerBackground,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    signInWithGoogle().then(
                                      (data) {
                                        ipController.isLoggedIn.value = true;
                                        ipController.userObj = data;
                                      },
                                    ).catchError(
                                      (e) {},
                                    );
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
                                  height: 10.h,
                                ),
                                login == true
                                    ? Column(
                                        children: [
                                          CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                User["picture"]["data"]["url"],
                                              ),
                                              radius: 30),
                                          Text(User["name"]),
                                          Text(User["email"]),
                                          TextButton(
                                              onPressed: () {
                                                FacebookAuth.instance
                                                    .logOut()
                                                    .then((value) {
                                                  // ipController.isLoggedIn
                                                  //     .value = false;
                                                  // ipController.fbData.value =
                                                  //     {};
                                                  setState(() {
                                                    login = false;
                                                    User = {};
                                                  });
                                                });
                                              },
                                              child: Text("LogOut"))
                                        ],
                                      )
                                    : AppContainer(
                                        height: 6.h,
                                        width: 60.w,
                                        color: AppColor.containerBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          FacebookAuth.instance.login(
                                              loginBehavior:
                                                  LoginBehavior.dialogOnly,
                                              permissions: [
                                                "public_profile",
                                                "email"
                                              ]).then((value) {
                                            FacebookAuth.instance
                                                .getUserData()
                                                .then((userData) {
                                              // ipController.isLoading.value =
                                              //     true;
                                              // ipController.fbData.value =
                                              //     userData;
                                              setState(() {
                                                login = true;
                                                User = userData;
                                              });
                                            });
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(AppImage.fb,
                                                height: 8.w),
                                            const CustomeText(
                                              title: AppString.fbLogin,
                                            ),
                                          ],
                                        ))
                              ],
                            ),
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
                  controller: _homeController.tabController,
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
                    // dragStartBehavior: dragStartBehavior,
                    controller: _homeController.tabController,
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
// login
// ? Column(
// children: [
// // Container(
// //   child: Image.network(
// //     User["picture"]["data"]
// //         ["url"],
// //     fit: BoxFit.cover,
// //   ),
// //   height: 40,
// //   width: 40,
// //   decoration: BoxDecoration(
// //       shape: BoxShape.circle),
// // ),
// Text(User["name"]),
// Text(User["email"]),
// TextButton(
// onPressed: () {
// FacebookAuth.instance
//     .logOut()
//     .then((value) {
// setState(() {
// login = false;
// User = {};
// setState(() {});
// });
// });
// },
// child: Text("LogOut"))
// ],
// )
// :
