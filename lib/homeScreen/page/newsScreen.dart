import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
<<<<<<< HEAD
=======

>>>>>>> 5024a6b3c0b2c6a2142bf96e31458fced7ca9250
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../T20Predictions/page/utills/color.dart';
import '../../T20Predictions/page/utills/string.dart';
import '../../widget/custom_container.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = "/NewsScreen";
  NewsScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        title: CustomeText(
          title: AppString.news,
        ),
        backgroundColor: AppColor.blackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppContainer(
                height: 20.h,
                borderRadius: BorderRadius.circular(10.sp),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${homeController.newsModel.value.news?[0].image}"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomeText(
                title: "${homeController.newsModel.value.news?[0].title}",
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              CustomeText(
                title: "${homeController.newsModel.value.news?[0].smallDesc}",
                fontSize: 10.sp,
                color: AppColor.whiteColor.withOpacity(0.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              CustomeText(
                title: "${homeController.newsModel.value.news?[0].newsSource}",
                fontSize: 8.sp,
                color: AppColor.whiteColor.withOpacity(0.5),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              CustomeText(
                title: homeController.timeAgo(homeController
                    .data(homeController.newsModel.value.news?[0].time)),
                fontSize: 8.sp,
                color: AppColor.whiteColor.withOpacity(0.5),
              ),
              const Divider(),
              SizedBox(
                child: ListView.builder(
                  itemCount: homeController.newsModel.value.news?.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            AppContainer(
                              height: 15.h,
                              width: 30.w,
                              borderRadius: BorderRadius.circular(10.sp),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${homeController.newsModel.value.news?[index].image}"),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomeText(
                                      title:
                                          "${homeController.newsModel.value.news?[index].title}",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    CustomeText(
                                      title:
                                          "${homeController.newsModel.value.news?[index].smallDesc}",
                                      fontSize: 7.sp,
                                      color:
                                          AppColor.whiteColor.withOpacity(0.5),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    CustomeText(
                                      title:
                                          "${homeController.newsModel.value.news?[index].newsSource}",
                                      fontSize: 7.sp,
                                      color:
                                          AppColor.whiteColor.withOpacity(0.5),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    CustomeText(
                                      title: homeController.timeAgo(
                                          homeController.data(homeController
                                              .newsModel
                                              .value
                                              .news?[index]
                                              .time)),
                                      fontSize: 7.sp,
                                      color:
                                          AppColor.whiteColor.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                height: 15.h,
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
