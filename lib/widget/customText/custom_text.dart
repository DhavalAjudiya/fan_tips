import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  const AppText({
    Key? key,
    this.data = "",
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
