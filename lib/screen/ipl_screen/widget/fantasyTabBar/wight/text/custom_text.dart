import 'package:flutter/cupertino.dart';

class AppCustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final bool? softWrap;
  const AppCustomText({
    Key? key,
    this.data = "",
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      softWrap: softWrap,
      style: TextStyle(
        fontFamily: "SF-UI-Display",
        overflow: overflow,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
