import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String? title;

  const CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: InkWell(
        onTap: () => Get.back(),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      title: Text(
        title!,
        style: const TextStyle(
          fontFamily: 'WorkSan',
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
