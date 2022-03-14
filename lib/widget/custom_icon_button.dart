import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;
  const CustomBackButton({Key? key, this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
