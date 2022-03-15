import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../matches/widget/style.dart';
import '../utills/color.dart';

class CustomContainer extends StatelessWidget {
  final String headertext;
  final String text;
  final String subText;
  final String predictionText;
  final String prediction;
  final String lastText;
  final String t1run;
  final String t1wk;
  final String t1over;
  final String t2run;
  final String t2wk;
  final String t2over;
  final ImageProvider? backgroundImage;
  final ImageProvider? secondbackgroundImage;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? ontap;
  final Widget icon;
  final VoidCallback? onTap;

  const CustomContainer({
    this.headertext = "",
    this.text = "",
    this.backgroundImage,
    this.secondbackgroundImage,
    this.subText = "",
    this.predictionText = "",
    this.prediction = "",
    this.lastText = "",
    this.margin,
    this.t1run = "",
    this.t1wk = "",
    this.t1over = "",
    this.t2run = "",
    this.t2wk = "",
    this.t2over = "",
    this.ontap,
    required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 19.h,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColor.containerBackground,
          borderRadius: BorderRadius.circular(7.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    headertext,
                    style: AppStyle.title,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: ontap,
                    child: icon,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundImage: backgroundImage,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            text,
                            style: AppStyle.cuntryname,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4.w,
                            backgroundImage: secondbackgroundImage,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            subText,
                            style: AppStyle.cuntryname,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            t1run,
                            style: AppStyle.cuntryname,
                          ),
                          Text(
                            t1wk,
                            style: AppStyle.cuntryname,
                          ),
                          Text(
                            t1over,
                            style: AppStyle.over,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            t2run,
                            style: AppStyle.cuntryname,
                          ),
                          Text(
                            t2wk,
                            style: AppStyle.cuntryname,
                          ),
                          Text(
                            t2over,
                            style: AppStyle.over,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 3.w),
                  Container(
                    width: 0.3.w,
                    height: 7.h,
                    color: const Color(0xff4E4E4E),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    children: [
                      Text(
                        predictionText,
                        style: AppStyle.preadiction,
                      ),
                      Text(
                        prediction,
                        style: AppStyle.predication,
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
                  Text(
                    lastText,
                    style: AppStyle.title,
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

class CustomLCContainer extends StatelessWidget {
  final String headertext;
  final String text;
  final String subText;
  final String predictionText;
  final String prediction;
  final String lastText;
  final String t1run;
  final String t1wk;
  final String t1owk;
  final String t1over;
  final String t2run;
  final String t2wk;
  final String t2owk;
  final String t2over;
  final ImageProvider? backgroundImage;
  final ImageProvider? secondbackgroundImage;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? ontap;
  final Widget icon;

  CustomLCContainer({
    this.headertext = "",
    this.text = "",
    this.backgroundImage,
    this.secondbackgroundImage,
    this.subText = "",
    this.predictionText = "",
    this.prediction = "",
    this.lastText = "",
    this.margin,
    this.t1run = "",
    this.t1wk = "",
    this.t1over = "",
    this.t2run = "",
    this.t2wk = "",
    this.t2over = "",
    this.ontap,
    required this.icon,
    this.t1owk = "",
    this.t2owk = "",
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.sp),
        child: Card(
          color: AppColor.containerBackground,
          // height: 16.h,
          // decoration: BoxDecoration(
          //   color: AppColor.containerBackground,
          //   borderRadius: BorderRadius.circular(7.sp),
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 4.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      headertext,
                      style: AppStyle.title,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: ontap,
                      child: icon,
                    ),
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
                              radius: 4.w,
                              backgroundImage: backgroundImage,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              text,
                              style: AppStyle.cuntryname,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4.w,
                              backgroundImage: secondbackgroundImage,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              subText,
                              style: AppStyle.cuntryname,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "$t1run/",
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              t1wk,
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              " & $t1over/",
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              "$t1owk",
                              style: AppStyle.cuntryname,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "$t2run/",
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              t2wk,
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              " & $t2over/",
                              style: AppStyle.cuntryname,
                            ),
                            Text(
                              "$t2owk",
                              style: AppStyle.cuntryname,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 3.w),
                    Container(
                      width: 0.3.w,
                      height: 7.h,
                      color: const Color(0xff4E4E4E),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      children: [
                        Text(
                          predictionText,
                          style: AppStyle.preadiction,
                        ),
                        Text(
                          prediction,
                          style: AppStyle.predication,
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
                    Text(
                      lastText,
                      style: AppStyle.title,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
