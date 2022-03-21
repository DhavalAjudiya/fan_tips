import 'package:fantips/upcoming_matches/widget/live_score_screen/scorecard_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../T20Predictions/page/utills/color.dart';
import '../../../ipl_screen/controller/ipl_controller.dart';
import '../../../matches/widget/upcoming_matches/widget/fantasy_tab.dart';
import '../../../screen/ipl_screen/widget/fantasyTabBar/fantasy_tabBar.dart';
import 'commentry_screen.dart';

class LiveScoreScreen extends StatelessWidget {
  LiveScoreScreen({Key? key}) : super(key: key);

  final IplController iplController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        backgroundColor: AppColor.greyBackGround,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('CSK batting'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: iplController.tabController1,
              tabs: iplController.upcoming,
              indicatorColor: AppColor.greenColor,
              indicatorWeight: 2.5,
              labelColor: AppColor.greenColor,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              unselectedLabelStyle:
                  const TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
              unselectedLabelColor: Colors.white,
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
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
