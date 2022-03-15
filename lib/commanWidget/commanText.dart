import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomeText({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "circular",
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
