import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utills/string.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);
  final prediction = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Shear Button
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppContainer(
                onTap: () {
                  Share.share(
                    "https://play.google.com/store/apps/details?id=fantasy.prediction.fantips",
                  );
                },
                child: SvgPicture.asset(
                  IconAsset.share,
                  height: 3.5.h,
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 9.h,
          backgroundImage: NetworkImage(prediction["img"]),
        ),
        SizedBox(height: 3.h),
        CustomeText(
          title: prediction["subtext"],
          fontSize: 3.h,
          fontWeight: FontWeight.w100,
        ),
        SizedBox(
          height: 1.5.h,
        ),

        /// you tube
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImage.youTub,
              height: 2.1.h,
            ),
            SizedBox(
              width: 1.w,
            ),
            CustomeText(
              title: AppString.youTub,
              fontSize: 2.2.h,
            ),
          ],
        ),
        SizedBox(height: 1.5.h),

        /// view channel
        InkWell(
          onTap: () {
            launch("https://www.youtube.com/c/${prediction["text"]}");
            print("rthj9poiya${prediction['text']}");
          },
          child: AppContainer(
            height: 3.1.h,
            width: 25.w,
            color: AppColor.blackColor,
            borderRadius: BorderRadius.circular(2),
            child: Center(
              child: CustomeText(
                fontSize: 1.7.h,
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
                          fontSize: 5.h,
                          title: prediction["prediction"],
                          fontWeight: FontWeight.w500,
                        ),
                        CustomeText(
                          fontSize: 2.h,
                          title: AppString.prediction,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomeText(
                          fontSize: 4.h,
                          title: prediction["avgScore"],
                          fontWeight: FontWeight.w500,
                        ),
                        CustomeText(
                          fontSize: 2.h,
                          title: AppString.avgScore1,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
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
                          fontSize: 4.h,
                          title: prediction["win"],
                          fontWeight: FontWeight.w500,
                        ),
                        CustomeText(
                          fontSize: 2.h,
                          title: AppString.wins,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomeText(
                          fontSize: 3.5.h,
                          title: prediction["subscribers"],
                          fontWeight: FontWeight.w500,
                        ),
                        CustomeText(
                          fontSize: 2.h,
                          title: AppString.subscribers,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 180,
              child: AppContainer(
                height: 25.h,
                color: AppColor.verticalDividerColor,
                width: 0.1.w,
              ),
            ),
          ],
        ),
        const Spacer(),

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
    );
  }
}
