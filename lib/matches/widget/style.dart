import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyle {
  static final current = TextStyle(
      color: Colors.white,
      fontFamily: "circular",
      fontSize: 17.sp,
      fontWeight: FontWeight.w500);

  static final tomorrow = TextStyle(
      color: Colors.white,
      fontFamily: "circular",
      fontSize: 13.sp,
      fontWeight: FontWeight.w900);

  static final title = TextStyle(
      color: Colors.white54,
      fontFamily: "circular",
      fontSize: 11.sp,
      fontWeight: FontWeight.w400);
  static final cuntryname = TextStyle(
      color: Colors.white,
      fontFamily: "circular",
      fontSize: 12.sp,
      fontWeight: FontWeight.w600);
  static final preadiction = TextStyle(
      color: Colors.green,
      fontFamily: "circular",
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  static final predication = TextStyle(
      color: Colors.green,
      fontFamily: "circular",
      fontSize: 10.sp,
      fontWeight: FontWeight.w400);

  static final over = TextStyle(
      color: Colors.white30,
      fontFamily: "circular",
      fontSize: 9.sp,
      fontWeight: FontWeight.w500);

  ///yeay search
  static final headers = TextStyle(
      letterSpacing: 0.2,
      fontFamily: "SFUIText",
      color: const Color(0xff000000),
      fontSize: 16.sp,
      fontWeight: FontWeight.bold);

  static final search = TextStyle(
    color: const Color(0xffBEBEBE),
    fontFamily: "SFUIText",
    fontSize: 16.sp,
  );
  static final text = TextStyle(
    letterSpacing: 0.5,
    fontFamily: "SFUIText",
    fontWeight: FontWeight.w600,
    fontSize: 11.sp,
  );
  static final uerName = TextStyle(
    color: Colors.black.withOpacity(0.7),
    fontFamily: "SFUIText",
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
}
