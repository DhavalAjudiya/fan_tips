import 'package:flutter/material.dart';

import '../utills/string.dart';

class CustomeText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomeText({
    Key? key,
    this.title = "",
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: AppString.circular,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
