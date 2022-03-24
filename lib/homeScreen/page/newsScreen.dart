import 'dart:developer';

import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/homeScreen/data/homepageController.dart';
import 'package:fantips/homeScreen/page/newsDetailedPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../utills/string.dart';
import '../../widget/custom_container.dart';
import 'newsDetailedPage.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = "/NewsScreen";
  NewsScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const CustomeText(
          title: AppString.news,
        ),
        backgroundColor: AppColor.blackColor,
      ),
      body: Obx(() {
        log("${homeController.isLoading.value}");
        return SmartRefresher(
          onRefresh: homeController.refreshNews,
          controller: homeController.refreshNewsController,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppContainer(
                    onTap: () {
                      Get.toNamed(NewsDetailedScreen.routeName, arguments: {
                        "image": homeController.newsModel.value.news?[0].image,
                        "title": homeController.newsModel.value.news?[0].title,
                        "subtitle":
                            homeController.newsModel.value.news?[0].smallDesc,
                        "time": homeController.timeAgo(homeController.data(
                            homeController.newsModel.value.news?[0].time)),
                      });
                    },
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
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomeText(
                    title:
                        "${homeController.newsModel.value.news?[0].smallDesc}",
                    fontSize: 8.sp,
                    color: AppColor.whiteColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomeText(
                    title:
                        "${homeController.newsModel.value.news?[0].newsSource}",
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
                    child: Obx(() {
                      log("${homeController.newsPagination.value.length}");
                      return ListView.builder(
                        controller: homeController.scrollController,
                        itemCount: homeController.isLoading.value
                            ? homeController.newsPagination.length + 1
                            : homeController.newsPagination.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return (homeController.newsPagination.length - 1 ==
                                  index)
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 40, top: 10),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            NewsDetailedScreen.routeName,
                                            arguments: {
                                              "image": homeController
                                                  .newsPagination[index].image,
                                              "title": homeController
                                                  .newsPagination[index].title,
                                              "subtitle": homeController
                                                  .newsPagination[index]
                                                  .smallDesc,
                                              "time": homeController.timeAgo(
                                                  homeController.data(
                                                      homeController
                                                          .newsPagination[index]
                                                          .time)),
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          AppContainer(
                                            height: 15.h,
                                            width: 30.w,
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${homeController.newsPagination[index].image}"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomeText(
                                                    title:
                                                        "${homeController.newsPagination[index].title}",
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  CustomeText(
                                                    title:
                                                        "${homeController.newsPagination[index].smallDesc}",
                                                    fontSize: 7.sp,
                                                    color: AppColor.whiteColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  CustomeText(
                                                    title:
                                                        "${homeController.newsPagination[index].newsSource}",
                                                    fontSize: 7.sp,
                                                    color: AppColor.whiteColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  CustomeText(
                                                    title: homeController
                                                        .timeAgo(homeController
                                                            .data(homeController
                                                                .newsPagination[
                                                                    index]
                                                                .time)),
                                                    fontSize: 7.sp,
                                                    color: AppColor.whiteColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                              height: 15.h,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                );
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
