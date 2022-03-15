import 'package:url_launcher/url_launcher.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:fantips/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../utills/asset.dart';
import '../../widget/current_match_container.dart';
import '../../widget/custom_container.dart';
import 'prediction_controller.dart';

class T20Prediction extends StatelessWidget {
  static const routeName = "/T20Prediction";
  final PredictionController _predictionController =
      Get.put(PredictionController());

  @override
  Widget build(BuildContext context) {
    final predictionData = Get.arguments;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            _backButton(predictionData),
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
                _tabBar(predictionData),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton(predictionData) {
    return Row(
      children: [
        const CustomBackButton(
          icon: Icons.arrow_back,
          color: AppColor.white,
        ),
        CustomeText(
          title: "${predictionData["title"]}",
          fontSize: 3.h,
        ),
      ],
    );
  }

  Widget _tabBar(predictionData) {
    return SizedBox(
      height: 82.h,
      child: TabBarView(
        controller: _predictionController.tabController,
        children: [
          Column(
            children: [
              /// Shear Button
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppContainer(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconAsset.share,
                        height: 3.5.h,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(predictionData["image"]),
                radius: 9.h,
                backgroundColor: AppColor.grey,
                child: CustomeText(
                  color: AppColor.containerBackground,
                  fontSize: 6.h,
                ),
              ),
              SizedBox(height: 3.h),
              CustomeText(
                title: "${predictionData["title"]}",
                fontSize: 3.h,
                fontWeight: FontWeight.w100,
              ),
              SizedBox(height: 1.5.h),

              /// you tube
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.youTub,
                    height: 2.5.h,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  const CustomeText(
                    title: AppString.youTub,
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),

              /// view channel
              InkWell(
                onTap: () {
                  launch(AppString.youTubeUrl);
                },
                child: AppContainer(
                  height: 3.3.h,
                  width: 31.w,
                  color: AppColor.blackColor,
                  borderRadius: BorderRadius.circular(2),
                  child: Center(
                    child: CustomeText(
                      fontSize: 1.9.h,
                      title: AppString.viewChannel,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CustomeText(
                                fontSize: 5.5.h,
                                title: "${predictionData["prediction"]}",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 1.5.h),
                              CustomeText(
                                fontSize: 2.5.h,
                                title: AppString.prediction,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomeText(
                                fontSize: 5.h,
                                title: "${predictionData["averageScore"]}",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 1.5.h),
                              CustomeText(
                                fontSize: 2.5.h,
                                title: AppString.avgScore,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: const EdgeInsets.only(right: 42, left: 42),
                        child: Divider(
                          color: AppColor.verticalDividerColor,
                          thickness: 0.1.h,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CustomeText(
                                fontSize: 5.h,
                                title: "${predictionData["win"]}",
                                fontWeight: FontWeight.w500,
                              ),
                              CustomeText(
                                fontSize: 2.5.h,
                                title: AppString.wins,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomeText(
                                fontSize: 3.5.h,
                                title: "${predictionData["subscribers"]}",
                                fontWeight: FontWeight.w500,
                              ),
                              CustomeText(
                                fontSize: 2.h,
                                title: AppString.subscribers,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 165,
                    child: AppContainer(
                      height: 35.h,
                      color: AppColor.verticalDividerColor,
                      width: 0.1.w,
                    ),
                  ),
                ],
              ),
              Spacer(),

              /// ads
              AppContainer(
                onTap: () {},
                height: 6.5.h,
                color: AppColor.grey,
                child: const Center(
                  child: CustomeText(
                    title: AppString.ads,
                    color: AppColor.background,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: Obx(
                  () => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _predictionController
                        .currentMatch.value.matches?.notstarted?.length,
                    itemBuilder: (context, index) {
                      final current = _predictionController
                          .currentMatch.value.matches?.notstarted?[index];
                      return Obx(
                        () => CustomLCContainer(
                          margin: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 2.w),
                          headertext: current?.matchName ?? "",
                          ontap: () {
                            if (_predictionController.selected.value == false) {
                              _predictionController.selected.value == true;
                            } else {
                              _predictionController.selected.value == false;
                            }
                          },
                          icon: _predictionController.selected.value == false
                              ? const Icon(Icons.notifications)
                              : const Icon(Icons.notifications_none),
                          backgroundImage: NetworkImage(
                            current?.t1Flag ?? AppString.imageNotFound,
                          ),
                          text: current?.team1Name ?? "",
                          secondbackgroundImage: NetworkImage(
                            current?.t2Flag ?? AppString.imageNotFound,
                          ),
                          subText: current?.team2Name ?? "",
                          t1run: "${current?.t1Run}",
                          t1wk: "${current?.t1Wk}",
                          t1over: "${current?.t1Over}",
                          t2run: "${current?.t2Run}",
                          t2wk: "${current?.t2Wk}",
                          t2over: "${current?.t2Over}",
                          predictionText: "${current?.totalprediction ?? ""}",
                          prediction: "Prediction",
                          lastText: "Prince",
                          // _predictionController.timeAgo(
                          //   current?.startTime ?? 0,
                          //),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
