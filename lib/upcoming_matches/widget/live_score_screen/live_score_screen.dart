import 'package:fantips/upcoming_matches/widget/live_score_screen/quiz_tab.dart';
import 'package:fantips/upcoming_matches/widget/live_score_screen/scorecard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../expert/page/search_screen.dart';
import '../../../screen/ipl_screen/page/fantasy_tabBar.dart';
import '../../../T20Predictions/page/utills/color.dart';
import '../../../ipl_screen/controller/ipl_controller.dart';
import 'commentry_screen.dart';

class LiveScoreScreen extends StatelessWidget {
  static const routeName = '/LiveScoreScreen';
  LiveScoreScreen({Key? key}) : super(key: key);
  final IplController iplController = Get.put(IplController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        backgroundColor: AppColor.greyBackGround,
        leading: InkWell(
          onTap: () {
            Get.back();
            print("objeasdadasdct");
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('CSK batting'),
        actions: [
          InkWell(
            onTap: () {
              print("objeasdadasdct");
              Get.toNamed(Search.routeName);
            },
            child: Icon(
              Icons.search,
              size: 2.7.h,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: iplController.tabController1,
              tabs: iplController.upcoming,
              indicatorColor: AppColor.greenColor,
              indicatorWeight: 2.5,
              isScrollable: true,
              labelColor: AppColor.greenColor,
              unselectedLabelColor: AppColor.white,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              unselectedLabelStyle:
                  TextStyle(fontStyle: FontStyle.normal, fontSize: 13.sp),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: iplController.tabController1,
        children: [
          // fantasy
          FantasyTabBar(),
          // commentry
          Commentary(),
          // scorecard
          ScoreCardScreen(),
          // quiz
          QuizScreen()
        ],
      ),
    );
  }
}
