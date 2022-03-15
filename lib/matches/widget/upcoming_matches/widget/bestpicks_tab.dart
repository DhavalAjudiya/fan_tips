import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../T20Predictions/page/utills/color.dart';
import '../../../../T20Predictions/page/utills/string.dart';
import '../../../../commanWidget/commanText.dart';
import '../../../../widget/custom_container.dart';
import '../controller/upcoming_controller.dart';

class BestPicksTab extends StatelessWidget {
  BestPicksTab({Key? key}) : super(key: key);
  final upcomingController = Get.put(UpcomingMatchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                childrenPadding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/glove.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.wk,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.wicketKeeper,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/bat.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.bat,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.batsman,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/batball.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.ar,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.allRounder,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/ball.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.bowl,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.bowler,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/captain.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.cap,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.captain,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: AppColor.blackColor,
              child: ExpansionTile(
                backgroundColor: AppColor.blackColor,
                iconColor: AppColor.whiteColor,
                title: Row(
                  children: [
                    AppContainer(
                      width: 22.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/image/vicecaptain.svg",
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          CustomeText(
                            title: AppString.vc,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomeText(
                      title: AppString.viceCaptain,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                children: [
                  Divider(
                    height: 0.4.sp,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomeText(
                          title: AppString.playerName,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomeText(
                          title: AppString.selectedBy,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: AppContainer(
                      height: 6.h,
                      width: 13.w,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/69/Rohit_Sharma_2015_%28cropped%29.jpg",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text("NO IMAGE!!!"),
                        ),
                      ),
                    ),
                    title: CustomeText(
                      title: "Rohit Sharma",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    subtitle: CustomeText(
                      title: "MI",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: CustomeText(
                        title: "19.75%",
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
