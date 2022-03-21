import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../T20Predictions/page/utills/string.dart';
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
        title: Text(AppString.currentMatches),
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
                    Obx( () => IplCardMatches(
                        onTap: () {
                          if (iplController.isOn.value == false) {
                            iplController.isOn.value = true;
                          } else {
                            iplController.isOn.value = false;
                          }
                        },
                        icon: iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
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
                            child: Obx( () => UpcomingIpl(
                                width: 88.w,
                                onTap: () {
                                  if (iplController.isOn.value == false) {
                                    iplController.isOn.value = true;
                                  } else {
                                    iplController.isOn.value = false;
                                  }
                                },
                                icon:
                                    iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
                                titleMatches: 'RCB vc DC IPL,2021',
                                image1: IconAsset.logoRCB,
                                textTeam1: 'RCB',
                                image2: IconAsset.logoDC,
                                textTeam2: 'DC',
                                time: '06:00 PM',
                                dayAgo: 'Match Start in 2 Days',
                              ),
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
                            child: Obx( () =>
                              UpcomingIpl(
                                onTap: () {
                                  if (iplController.isOn.value == false) {
                                    iplController.isOn.value = true;
                                  } else {
                                    iplController.isOn.value = false;
                                  }
                                },
                                icon:
                                    iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
                                width: 88.w,
                                titleMatches: 'PNJ vc KKR IPL,2021',
                                image1: IconAsset.logoPNJ,
                                textTeam1: 'PNJ',
                                image2: IconAsset.logoKKR,
                                textTeam2: 'KKR',
                                time: '06:00 PM',
                                dayAgo: 'Match Start in 2 Days',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
                      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
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
