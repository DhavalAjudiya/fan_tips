import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utills/string.dart';
import 'matchs_controller.dart';
import '../widget/completed.dart';
import '../widget/live.dart';
import '../widget/upcoming.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = "/home_screen";

  MatchesScreen({Key? key}) : super(key: key);
  final _homecontroller = Get.put(HomeScreenContrroler());

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
              Text(
                AppString.title,
                // style: AppStyle.current,
              ),
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
                    child: Text(
                      AppString.upcoming,
                    ),
                  ),
                  Tab(
                    child: Text(
                      AppString.live,
                    ),
                  ),
                  Tab(
                    child: Text(
                      AppString.completed,
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
