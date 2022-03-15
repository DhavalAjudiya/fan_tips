import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/T20Predictions/widget/info.dart';
import 'package:fantips/expert/T20Predictions/prediction_controller.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../widget/matches.dart';

class T20Prediction extends StatelessWidget {
  static const routeName = "/T20Prediction";
  final PredictionController _predictionController =
      Get.put(PredictionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            _backButton(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      indicatorColor: AppColor.green,
                      indicatorWeight: 0.2.h,
                      unselectedLabelColor: AppColor.backgroundColorBlack,
                      onTap: (index) {
                        _predictionController.selected.value = index;
                      },
                      physics: ScrollPhysics(),
                      controller: _predictionController.tabController,
                      tabs: [
                        Tab(
                          child: CustomeText(
                            color: _predictionController.selected.value == 0
                                ? AppColor.green
                                : AppColor.white,
                            title: AppString.info,
                            fontSize: 2.5.h,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Tab(
                          child: CustomeText(
                            color: _predictionController.selected.value == 1
                                ? AppColor.green
                                : AppColor.white,
                            title: AppString.matches,
                            fontSize: 2.5.h,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _tabBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return Row(
      children: [
        const CustomBackButton(
          icon: Icons.arrow_back,
          color: AppColor.white,
        ),
        CustomeText(
          title: AppString.t20,
          fontSize: 3.h,
        ),
      ],
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 82.h,
      child: TabBarView(
        controller: _predictionController.tabController,
        children: [
          InfoPage(),
          MatchesPage(),
        ],
      ),
    );
  }
}
