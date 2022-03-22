import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../ipl_screen/controller/ipl_controller.dart';
import '../../../utills/string.dart';
import '../../../T20Predictions/page/utills/asset.dart';
import '../../../T20Predictions/page/utills/color.dart';
import '../widget/fantasyTabBar/fantasy_tabBar.dart';
import '../widget/fantasyTabBar/fantasy_tabBar.dart';
import '../widget/fantasyTabBar/search_screen.dart';

class UpcomingIplPage extends StatelessWidget {
  static const routeName = "/UpcomingIplScreen";
  UpcomingIplPage({Key? key}) : super(key: key);

  final IplController ipController = Get.put(IplController());

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
        title: Row(
          children: [
            const Text(AppString.wi),
            SizedBox(
              width: 1.5.w,
            ),
            SvgPicture.asset(
              AppImage.flash,
              height: 1.3.h,
            ),
            SizedBox(
              width: 1.8.w,
            ),
            const Text(AppString.eng),
            const Spacer(),
            IconButton(
              onPressed: () {
                Get.toNamed(SearchScreen.routeName);
              },
              icon: Icon(
                Icons.search,
                size: 2.7.h,
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: ipController.tabController1,
              tabs: ipController.upcoming,
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
        controller: ipController.tabController1,
        children: [
          FantasyTabBar(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
