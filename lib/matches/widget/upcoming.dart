import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../page/matchs_controller.dart';

class UpComing extends StatelessWidget {
  final _homecontroller = Get.put(HomeScreenContrroler());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        // Text(
        //   AppString.tomorrow,
        //   style: AppStyle.tomorrow,
        // ),
        SizedBox(
          height: 1.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                _homecontroller.currentMatch.value.matches?.notstarted?.length,
            itemBuilder: (context, index) {
              final current = _homecontroller
                  .currentMatch.value.matches?.notstarted?[index];
              return Container(
                height: 18.h,
                margin: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                decoration: BoxDecoration(
                  // color: AppColors.container,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 0.5.w, horizontal: 3.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            current?.matchName ?? "",
                            // style: AppStyle.title,
                          ),
                          const Spacer(),
                          Obx(() {
                            return IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                if (current?.selected.value == false) {
                                  current?.selected.value = true;
                                } else {
                                  current?.selected.value = false;
                                }
                              },
                              icon: current?.selected.value == false
                                  ? const Icon(Icons.notifications)
                                  : const Icon(Icons.notifications_none),
                              color: Colors.white,
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3.w,
                                    backgroundImage:
                                        NetworkImage("${current?.t1Flag}"),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    current?.team1Name ?? "",
                                    // style: AppStyle.cuntryname,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3.w,
                                    backgroundImage:
                                        NetworkImage("${current?.t2Flag}"),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    current?.team2Name ?? "",
                                    // style: AppStyle.cuntryname,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 0.3.w,
                            height: 7.h,
                            color: Color(0xff4E4E4E),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            children: [
                              Text(
                                "${current?.totalprediction ?? ""}",
                                // style: AppStyle.preadiction,
                              ),
                              Text(
                                "Prediction",
                                // style: AppStyle.predication,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Row(
                        children: [
                          // Text(
                          //   Utils.timeAgo(
                          //     Utils.time(current?.startTime ?? 0),
                          //   ),
                          //   style: AppStyle.title,
                          // ),
                          Text("${current?.startTime ?? 0}"),
                        ],
                      ),
                    ],
                  ),
                ),
              );
              // return CustomContainer(
              //   margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              //   headertext: current?.matchName ?? "",
              //   icon: _homecontroller.getdata ,
              //   backgroundImage: NetworkImage(current?.t1Flag ??
              //       "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png"),
              //   text: current?.team1Name ?? "",
              //   secondbackgroundImage: NetworkImage(current?.t2Flag ??
              //       "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png"),
              //   subText: current?.team2Name ?? "",
              //   predictionText: "${current?.totalprediction ?? ""}",
              //   prediction: "Prediction",
              //   lastText: _homecontroller.timeAgo(
              //     _homecontroller.time(current?.startTime),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }
}
