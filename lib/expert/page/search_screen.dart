import 'package:fantips/expert/data/controller.dart';
import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  IpController iplController = Get.find();

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
              color: AppColor.grey.shade600,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: iplController.searchController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(7),
                hintText: "Search",
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
