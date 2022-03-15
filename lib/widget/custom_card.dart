import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../T20Predictions/page/utills/asset.dart';
import '../T20Predictions/page/utills/color.dart';

class CustomCard extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  // ignore: use_key_in_widget_constructors
  const CustomCard({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 6.8.h,
        decoration: const BoxDecoration(color: AppColor.greyBackGround),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 4.w,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'WorkSan'),
              ),
              SizedBox(
                width: 1.8.w,
                height: 1.8.h,
                child: SvgPicture.asset(
                  IconAsset.icArrow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
