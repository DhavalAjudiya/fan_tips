import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final GestureTapCallback? onTap;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? fillColor;
  final InputBorder? border;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintStyle;
  const AppTextFormField(
      {Key? key,
      this.onTap,
      this.focusedBorder,
      this.enabledBorder,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.fillColor,
      this.border,
      this.contentPadding,
      this.controller,
      this.onChanged,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintStyle: hintStyle,
        fillColor: fillColor,
        border: border,
        filled: true,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
