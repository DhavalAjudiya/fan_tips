import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IplCardMatches extends StatelessWidget {
  final Widget? icon;
  final double? width;
  final double? height;
  final String? textTeam1;
  final String? textTeam2;
  final String? image1;
  final String? image2;
  final String? score1;
  final String? score2;
  final String? over1;
  final String? over2;
  final String? totalPrediction;
  final String? prediction;
  final String? time;
  final String? titleMatches;
  final VoidCallback? onTap;

  const IplCardMatches({
    Key? key,
    this.onTap,
    this.totalPrediction,
    this.prediction,
    this.time,
    this.titleMatches,
    this.textTeam1,
    this.textTeam2,
    this.score1,
    this.score2,
    this.over1,
    this.over2,
    this.image1,
    this.image2,
    this.width,
    this.height, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: width,
      decoration: BoxDecoration(
          color: AppColor.greyBackGround,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  titleMatches!,
                  style: Appstyle.subIplStyle,
                ),
                const Spacer(),
                InkWell(
                  child: icon,
                  onTap: onTap,
                )
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
                        Container(
                          width: 3.h,
                          height: 6.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            image1!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          textTeam1!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 23.w,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: score1!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp),
                              ),
                              TextSpan(
                                text: over1!,
                                style: TextStyle(fontSize: 9.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3.h,
                          height: 6.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            image2!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          textTeam2!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 26.w,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: score2!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp),
                              ),
                              TextSpan(
                                text: over2!,
                                style: TextStyle(fontSize: 9.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 2.52.w,
                ),
                Container(
                  width: 0.4.w,
                  height: 8.5.h,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Text(totalPrediction!, style: Appstyle.predictionINT),
                    Text(prediction!, style: Appstyle.subIplStyleGreen),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              time!,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class UpcomingIpl extends StatelessWidget {
  final double? width;
  final double? height;
  final String? textTeam1;
  final String? textTeam2;
  final String? image1;
  final String? image2;
  final String? time;
  final String? titleMatches;
  final String? dayAgo;
  final Widget? icon;
  final VoidCallback? onTap;

  const UpcomingIpl({
    Key? key,
    this.dayAgo,
    this.time,
    this.titleMatches,
    this.textTeam1,
    this.textTeam2,
    this.image1,
    this.image2,
    this.width,
    this.height, this.icon, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColor.greyBackGround,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  titleMatches!,
                  style: Appstyle.subIplStyle,
                ),
                const Spacer(),
                InkWell(
                  onTap: onTap,
                  child: icon,
                )
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
                        Container(
                          width: 3.h,
                          height: 6.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            image1!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          textTeam1!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3.h,
                          height: 6.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            image2!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          textTeam2!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 0.4.w,
                  height: 8.5.h,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    const Text(
                      'start At',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    Text(time!, style: Appstyle.deadLineStyle),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              dayAgo!,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
