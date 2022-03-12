import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColor.containerBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: AppColor.containerBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 0.2.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Container(
                                        height: 0.2.h,
                                        width: 3.5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Container(
                                        height: 0.2.h,
                                        width: 2.5.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    AppString.sortBy,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'circular',
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.predictions,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.average_score,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Divider(
                                  color: AppColor.verticalDividerColor,
                                  thickness: 0),
                              SizedBox(height: 1.h),
                              Text(
                                AppString.wins,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'circular',
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
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
                                color: AppColor.green,
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
                                color: AppColor.green,
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
                                color: AppColor.green,
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
                          color: AppColor.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.green,
                      ),
                    ],
                  ),
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
