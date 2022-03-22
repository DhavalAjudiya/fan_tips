import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/ipl_screen/controller/ipl_controller.dart';
import 'package:fantips/ipl_screen/widget/match_screen.dart';
import 'package:fantips/ipl_screen/widget/squad_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widget/point_table_tab.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';
import '../controller/ipl_controller.dart';

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
            SquadTab(),
            // Matches
            MatchTab(),
            // point table
            PointTableTab(),
          ],
        ),
      ),
    );
  }
}
