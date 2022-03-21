import 'dart:io';

import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';

import 'package:fantips/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';
import '../controller/ipl_controller.dart';
import '../data/data_ipl.dart';
import '../widget/custom_scoretile.dart';
import '../widget/squads_details.dart';

class IplScreen extends StatelessWidget {
  IplScreen({Key? key}) : super(key: key);
  static const routeName = "/ipl_screen";
  final IplController iplController = Get.put(IplController());

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
        appBar: AppBar(
          backgroundColor: AppColor.backGround,
          title: const Text(AppString.currentMatches),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                controller: iplController.tabController,
                tabs: iplController.myTabs,
                indicatorColor: AppColor.greenColor,
                indicatorWeight: 2.5,
                labelColor: AppColor.greenColor,
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.5),
                unselectedLabelStyle:
                    const TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                unselectedLabelColor: Colors.white,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 1.1.h),
          child: TabBarView(
            controller: iplController.tabController,
            children: [
              // Squads
              ListView.builder(
                itemCount: IplTems.length,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                    child: InkWell(
                      onTap: () {
                        Get.to(
                          () => const SquadsDetailsScreen(),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            IplTems[index]['teamLogo'],
                          ),
                        ),
                        title: Text(
                          IplTems[index]['team'],
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'WorkSan',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        tileColor: AppColor.greyBackGround,
                      ),
                    ),
                  );
                },
              ),
              // Matches
              Padding(
                padding: EdgeInsets.only(top: 1.2.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tomorrow,', style: Appstyle.deadLineStyle),
                          Text(' 15 May', style: Appstyle.deadLineStyle),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // card
                      IplCardMatches(
                        onTap: () {
                          if (iplController.isOn.value == false) {
                            iplController.isOn.value = true;
                          } else {
                            iplController.isOn.value = false;
                          }
                        },
                        icon: iplController.isOn.value == false
                            ? const Icon(Icons.notifications)
                            : const Icon(Icons.notifications_none_rounded),
                        width: 88.w,
                        titleMatches: 'RR vc RCB IPL,2021',
                        image1: IconAsset.logoCSK,
                        textTeam1: 'CSK',
                        score1: "168/4",
                        over1: '(20)',
                        image2: IconAsset.logoMI,
                        textTeam2: 'MI',
                        score2: "130/5",
                        over2: '(18.3)',
                        totalPrediction: '72',
                        prediction: 'Prediction',
                        time: 'Match Starts in 5:45',
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('sunday,', style: Appstyle.deadLineStyle),
                          Text(' 16 May', style: Appstyle.deadLineStyle),
                        ],
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      SizedBox(
                        height: 38.h,
                        width: 88.w,
                        child: ListView.builder(
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.3.h),
                              child: UpcomingIpl(
                                width: 88.w,
                                onTap: () {
                                  if (iplController.isOn.value == false) {
                                    iplController.isOn.value = true;
                                  } else {
                                    iplController.isOn.value = false;
                                  }
                                },
                                icon: iplController.isOn.value == false
                                    ? const Icon(Icons.notifications)
                                    : const Icon(
                                        Icons.notifications_none_rounded),
                                titleMatches: 'RCB vc DC IPL,2021',
                                image1: IconAsset.logoRCB,
                                textTeam1: 'RCB',
                                image2: IconAsset.logoDC,
                                textTeam2: 'DC',
                                time: '06:00 PM',
                                dayAgo: 'Match Start in 2 Days',
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('sunday,', style: Appstyle.deadLineStyle),
                          Text(' 16 May', style: Appstyle.deadLineStyle),
                        ],
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      SizedBox(
                        height: 38.h,
                        width: 88.w,
                        child: ListView.builder(
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.3.h),
                              child: UpcomingIpl(
                                onTap: () {
                                  if (iplController.isOn.value == false) {
                                    iplController.isOn.value = true;
                                  } else {
                                    iplController.isOn.value = false;
                                  }
                                },
                                icon: iplController.isOn.value == false
                                    ? const Icon(Icons.notifications)
                                    : const Icon(
                                        Icons.notifications_none_rounded),
                                width: 88.w,
                                titleMatches: 'PNJ vc KKR IPL,2021',
                                image1: IconAsset.logoPNJ,
                                textTeam1: 'PNJ',
                                image2: IconAsset.logoKKR,
                                textTeam2: 'KKR',
                                time: '06:00 PM',
                                dayAgo: 'Match Start in 2 Days',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Point Table
              // DataTable(
              //   columnSpacing: 1,
              //
              //   columns: [
              //     DataColumn(
              //       label: Text(
              //         'Teams',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'M',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'W',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'L',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'Point',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'NRR',
              //         style: Appstyle.pointTableGrey,
              //       ),
              //     )
              //   ],
              //   rows: [],
              // ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 4.w, right: 4.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppString.teams,
                          style: Appstyle.pointTableGrey,
                        ),
                        const Spacer(),
                        Text(
                          AppString.m,
                          style: Appstyle.pointTableGrey,
                        ),
                        SizedBox(
                          width: 3.5.w,
                        ),
                        Text(
                          AppString.w,
                          style: Appstyle.pointTableGrey,
                        ),
                        SizedBox(
                          width: 3.5.w,
                        ),
                        Text(
                          AppString.l,
                          style: Appstyle.pointTableGrey,
                        ),
                        SizedBox(
                          width: 3.5.w,
                        ),
                        Text(
                          AppString.points,
                          style: Appstyle.pointTableGrey,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          AppString.nrr,
                          style: Appstyle.pointTableGrey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: 91.w,
                      height: 45.h,
                      child: ListView.builder(
                        itemCount: pointTable.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 1.5.h),
                            child: SizedBox(
                              height: 5.h,
                              child: Column(
                                children: [
                                  Divider(
                                    height: 1.h,
                                    //    color: Colors.grey.withOpacity(0.4),
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.5.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          pointTable[index]['team'],
                                          style: Appstyle.pointTableWhite,
                                        ),
                                        const Spacer(),
                                        Text(
                                          '7',
                                          style: Appstyle.pointTableWhite,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '2',
                                          style: Appstyle.pointTableWhite,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '5',
                                          style: Appstyle.pointTableWhite,
                                        ),
                                        SizedBox(
                                          width: 6.5.w,
                                        ),
                                        Text(
                                          '10',
                                          style: Appstyle.pointTableWhite,
                                        ),
                                        SizedBox(
                                          width: 5.5.w,
                                        ),
                                        Text(
                                          "+0.55",
                                          style: Appstyle.pointTableWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
