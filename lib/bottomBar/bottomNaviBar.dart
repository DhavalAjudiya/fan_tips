import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../utills/string.dart';
import 'controller.dart';

class BottomNavigatorController extends StatelessWidget {
  static const routeName = "/BottomNavigatorController";
  final BottomController _neviController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => _neviController.page[_neviController.currentIndex.value]),
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
                AppString.homeImage,
                height: 4.h,
                width: 5.w,
                color: _neviController.currentIndex.value == 0
                    ? AppColor.whiteColor
                    : AppColor.whiteColor.withOpacity(0.5),
              ),
              label: AppString.home,
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                AppString.matchImage,
                height: 4.h,
                width: 5.w,
                color: _neviController.currentIndex.value == 1
                    ? AppColor.whiteColor
                    : AppColor.whiteColor.withOpacity(0.5),
              ),
              label: AppString.match,
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                AppString.iplImage,
                height: 4.h,
                width: 5.w,
                color: _neviController.currentIndex.value == 2
                    ? AppColor.whiteColor
                    : AppColor.whiteColor.withOpacity(0.5),
              ),
              label: AppString.ipl,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _neviController.currentIndex.value == 3
                    ? AppColor.whiteColor
                    : AppColor.whiteColor.withOpacity(0.5),
              ),
              label: AppString.expert,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_outlined,
                color: _neviController.currentIndex.value == 4
                    ? AppColor.whiteColor
                    : AppColor.whiteColor.withOpacity(0.5),
              ),
              label: AppString.mores,
            ),
          ],
        ),
      ),
    );
  }
}
