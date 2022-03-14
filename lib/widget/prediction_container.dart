import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PredictionContainer extends StatelessWidget {
  final ImageProvider? backgroundImage;
  String headerText;
  final String youtubeText;
  final String predictionCount;
  final String averageCount;
  final String winsCount;

  PredictionContainer({
    Key? key,
    this.backgroundImage,
    this.headerText = 'T20 Prediction',
    required this.youtubeText,
    required this.predictionCount,
    required this.averageCount,
    required this.winsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 16.h,
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
                    radius: 25,
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
                                    fontFamily: 'circular',
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/image/youtube.svg",
                                      height: 1.2.h),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    youtubeText,
                                    style: TextStyle(
                                      fontFamily: 'circular',
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.subTitleColor,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 31.5.w,
                          ),
                          IconButton(
                            splashColor: Colors.transparent,
                            icon: const Icon(Icons.favorite_border,
                                color: AppColor.green),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        "Prediction",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 0.2.w,
                    color: AppColor.verticalDividerColor,
                  ),
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
                        "Average Score",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
                        ),
                      ),
                    ],
                  ),
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
                        "Wins",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circular',
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
