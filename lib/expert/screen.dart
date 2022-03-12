import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../utills/asset.dart';
import '../utills/color.dart';
import '../utills/string.dart';
import '../widget/prediction_container.dart';

class ExpertScreen extends StatelessWidget {
  const ExpertScreen({Key? key}) : super(key: key);
  static const routeName = "/ExpertScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColorBlack,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppString.predictionExpert,
                    style: TextStyle(
                      fontFamily: 'circular',
                      color: AppColor.whiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                height: 7.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 0.2.h,
                            width: 6.w,
                            decoration: BoxDecoration(
                              color: const Color(0XFF25C06D),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            height: 0.3.h,
                          ),
                          Container(
                            height: 0.2.h,
                            width: 4.5.w,
                            decoration: BoxDecoration(
                              color: const Color(0XFF25C06D),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            height: 0.3.h,
                          ),
                          Container(
                            height: 0.2.h,
                            width: 2.5.w,
                            decoration: BoxDecoration(
                              color: const Color(0XFF25C06D),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      AppString.sortByAvgScore,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'circular',
                        color: const Color(
                          0XFF25C06D,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(
                        0XFF25C06D,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 79.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return PredictionContainer(
                        predictionCount: '10',
                        winsCount: '10',
                        youtubeText: '10',
                        averageCount: '10',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
