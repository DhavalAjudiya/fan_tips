import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/matches/widget/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widget/header_row.dart';
import '../controler/matchs_controller.dart';
import '../widget/completed.dart';
import '../widget/live.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = "/home_screen";

  MatchesScreen({Key? key}) : super(key: key);
  final _homecontroller = Get.put(MatchsScreenControoler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 1.w, left: 2.w, right: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }
}
