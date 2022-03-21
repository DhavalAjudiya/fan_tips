import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../T20Predictions/page/utills/color.dart';

class Appstyle {
  static TextStyle deadLineStyle = TextStyle(
    color: Colors.white,
    fontSize: 11.5.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'WorkSan',
  );
  static TextStyle subIplStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'WorkSan',
    fontWeight: FontWeight.w500,
  );
  static TextStyle subIplStyleGreen = const TextStyle(
    color: AppColor.greenColor,
    fontFamily: 'WorkSan',
    fontWeight: FontWeight.w600,
  );
  static TextStyle predictionINT = TextStyle(
    fontSize: 25.sp,
    color: AppColor.greenColor,
    fontFamily: 'WorkSan',
    fontWeight: FontWeight.bold,
  );
  static TextStyle pointTableGrey = TextStyle(
    color: Colors.grey,
    fontSize: 10.sp,
    fontFamily: 'WorkSan',
  );
  static TextStyle pointTableWhite = TextStyle(
    color: Colors.white,
    fontSize: 10.sp,
    fontFamily: 'WorkSan',
    fontWeight: FontWeight.w700,
  );
  static TextStyle moreStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'WorkSon',
    fontSize: 14.sp,
  );
  static TextStyle pointTitle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Workson',
    color: AppColor.grey,
  );
  static TextStyle pointSub = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Workson',
    color: AppColor.grey,
  );
  static TextStyle scoreTitle = TextStyle(
    color: AppColor.grey,
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
  );
}
