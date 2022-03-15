import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/utills/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreTextField extends StatelessWidget {
  final FormFieldValidator? validator;
  final String? labelText;
  final int? maxLines;
  final String? hint;

  const MoreTextField({
    this.hint,
    this.validator,
    this.labelText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 3,
      maxLines: maxLines,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'WorkSon',
          fontSize: 13.sp),
      validator: validator,
      cursorColor: AppColor.backGround,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'WorkSon',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 14.sp,
        ),
        labelText: labelText,
        labelStyle: Appstyle.moreStyle,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class MoreButtonScreen extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;

  const MoreButtonScreen({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 6.3.h,
          width: 75.w,
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'WorkSon',
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
