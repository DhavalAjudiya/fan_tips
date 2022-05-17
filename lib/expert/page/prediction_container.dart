import 'package:fantips/T20Predictions/page/utills/asset.dart';
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utills/string.dart';

class PredictionContainer extends StatelessWidget {
  final ImageProvider backgroundImage;
  final String headerText;
  final String youtubeText;
  final String predictionCount;
  final String averageCount;
  final String winsCount;
  final Widget icon;
  final VoidCallback? onPressed;

  PredictionContainer({
    Key? key,
    required this.backgroundImage,
    required this.headerText,
    required this.youtubeText,
    required this.predictionCount,
    required this.averageCount,
    required this.winsCount,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 17.h,
        decoration: BoxDecoration(
          color: const Color(0XFF1B1B1B),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            top: 12,
            bottom: 8,
            left: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: backgroundImage,
                    backgroundColor: AppColor.whiteColor,
                    radius: 2.7.h,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                headerText,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppString.circular,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppImage.youTub,
                                    height: 1.2.h,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    youtubeText,
                                    style: const TextStyle(
                                      fontFamily: AppString.circular,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.subTitleColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    icon: icon,
                    onPressed: onPressed,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 2.5.w),
                  Column(
                    children: [
                      Text(
                        predictionCount,
                        style: GoogleFonts.oswald(
                          color: AppColor.subTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        AppString.predictionData,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppString.circular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    height: 40,
                    width: 0.2.w,
                    color: AppColor.verticalDividerColor,
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    children: [
                      Text(
                        averageCount,
                        style: GoogleFonts.oswald(
                          color: AppColor.subTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        AppString.avregescor,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppString.circular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    height: 40,
                    width: 0.2.w,
                    color: AppColor.verticalDividerColor,
                  ),
                  Column(
                    children: [
                      Text(
                        winsCount,
                        style: GoogleFonts.oswald(
                          color: AppColor.subTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        AppString.wins,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppString.circular,
                        ),
                      ),
                      SizedBox(width: 25.w),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
