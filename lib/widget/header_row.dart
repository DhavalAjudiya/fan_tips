import 'package:fantips/utills/asset.dart';
import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../commanWidget/commanText.dart';
import 'custom_container.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  const HeaderRow({
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeText(
          title: title,
          color: AppColor.whiteColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6.w),
                  topLeft: Radius.circular(6.w),
                ),
              ),
              context: context,
              builder: (context) => SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 9.w,
                          ),
                          splashColor: AppColor.transparent,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                    Image.asset(AppImage.logo, height: 40.w),
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Row(
                        children: [
                          Container(
                            height: 0.2.h,
                            width: 27.w,
                            color: AppColor.grey,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const CustomeText(title: AppString.letsconnect),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 0.2.h,
                            width: 27.w,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppContainer(
                      height: 6.h,
                      width: 60.w,
                      color: AppColor.containerBackground,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImage.google, height: 8.w),
                          const CustomeText(
                            title: AppString.googleSign,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppContainer(
                      height: 6.h,
                      width: 60.w,
                      color: AppColor.containerBackground,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImage.fb, height: 8.w),
                          const CustomeText(
                            title: AppString.fbLogin,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: CustomeText(
            title: AppString.login,
            color: AppColor.green,
            fontWeight: FontWeight.w700,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
