import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controller.dart';

class BottomNavigatorController extends StatelessWidget {
  static const routeName = "/BottomNavigatorController";
  final BottomController _neviController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
            Obx(() => _neviController.page[_neviController.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 10.sp,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white.withOpacity(0.5),
            unselectedLabelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
            backgroundColor: Colors.black.withOpacity(0.5),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            currentIndex: _neviController.currentIndex.value,
            onTap: (value) {
              _neviController.currentIndex.value = value;
            },
            selectedLabelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Image.network(
                  "https://freeiconshop.com/wp-content/uploads/edd/home-outline.png",
                  height: 4.h,
                  width: 5.w,
                  color: _neviController.currentIndex.value == 0
                      ? AppColor.whiteColor
                      : AppColor.whiteColor.withOpacity(0.5),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.network(
                  "https://i0.wp.com/villagecricket.co/wp-content/uploads/2020/06/cultures.png?fit=512%2C512&ssl=1",
                  height: 4.h,
                  width: 5.w,
                  color: _neviController.currentIndex.value == 1
                      ? AppColor.whiteColor
                      : AppColor.whiteColor.withOpacity(0.5),
                ),
                label: "Matches",
              ),
              BottomNavigationBarItem(
                icon: Image.network(
                  "https://i0.wp.com/villagecricket.co/wp-content/uploads/2020/06/cultures.png?fit=512%2C512&ssl=1",
                  height: 4.h,
                  width: 5.w,
                  color: _neviController.currentIndex.value == 2
                      ? AppColor.whiteColor
                      : AppColor.whiteColor.withOpacity(0.5),
                ),
                label: "IPL",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _neviController.currentIndex.value == 3
                      ? AppColor.whiteColor
                      : AppColor.whiteColor.withOpacity(0.5),
                ),
                label: "Expert",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: _neviController.currentIndex.value == 4
                      ? AppColor.whiteColor
                      : AppColor.whiteColor.withOpacity(0.5),
                ),
                label: "More",
              ),
            ],
          ),
        ));
  }
}
