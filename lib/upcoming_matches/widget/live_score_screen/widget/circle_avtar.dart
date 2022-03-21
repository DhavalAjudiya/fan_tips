import 'package:flutter/cupertino.dart';

import '../../../../T20Predictions/page/utills/color.dart';

class CircleLogo extends StatelessWidget {

  final String? image;
  final double? height;
  final double? width;
  final Color? color;

  const CircleLogo({Key? key, this.image, this.height, this.width, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
      ),
      child: Image.asset(
        image!,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
