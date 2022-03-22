import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final double? size;
  const AppIconCustom(
      {Key? key, this.onPressed, this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
