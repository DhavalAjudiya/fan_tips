import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
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
    return Scaffold(
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
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
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
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
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
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          IplTems[index][AppString.teamLogo],
                        ),
                      ),
                      title: Text(
                        IplTems[index][AppString.team1],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppString.workSan,
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
                        Text(AppString.tomorrow, style: Appstyle.deadLineStyle),
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
                      icon: iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
                      width: 88.w,
                      titleMatches: AppString.rr,
                      image1: IconAsset.logoCSK,
                      textTeam1: AppString.csk,
                      score1: AppString.score1,
                      over1: AppString.over1,
                      image2: IconAsset.logoMI,
                      textTeam2: AppString.mi,
                      score2: AppString.score2,
                      over2: AppString.over2,
                      totalPrediction: AppString.totalPrediction,
                      prediction: AppString.prediction,
                      time: AppString.time,
                    )
                  ],
                ),
              ),
            ),
            // table
            Container(
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FractionColumnWidth(0.39),
                  1: FractionColumnWidth(0.12),
                  2: FractionColumnWidth(0.12),
                  3: FractionColumnWidth(0.12),
                  4: FractionColumnWidth(0.12),
                  5: FractionColumnWidth(0.12),
                },
                border: const TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: AppColor.greyBackGround,
                    style: BorderStyle.solid,
                  ),
                ),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Teams",
                          textAlign: TextAlign.start,
                          style: Appstyle.pointTitle,
                        ),
                      ),
                      Text(
                        'M',
                        textAlign: TextAlign.center,
                        style: Appstyle.pointTitle,
                      ),
                      Text(
                        'W',
                        textAlign: TextAlign.center,
                        style: Appstyle.pointTitle,
                      ),
                      Text(
                        'L',
                        textAlign: TextAlign.center,
                        style: Appstyle.pointTitle,
                      ),
                      Text(
                        'Points',
                        textAlign: TextAlign.center,
                        style: Appstyle.pointTitle,
                      ),
                      Text(
                        'NRR',
                        textAlign: TextAlign.center,
                        style: Appstyle.pointTitle,
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Chennai Super king',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Mumbai indians',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Delhi Capitalls',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '7',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '10',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '1.263',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Royal Challengers\nBanglore',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Rajasthan Royals',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'kings Xl Punjab',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Kolkata Knight Riders',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                      child: Text(
                        'Sunrisers Hyderabad',
                        textAlign: TextAlign.start,
                        style: Appstyle.pointTableWhite,
                      ),
                    ),
                    Text(
                      '8',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                    Text(
                      '0.547',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointTableWhite,
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
