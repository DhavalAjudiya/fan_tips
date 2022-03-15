import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../bottomBar/bottomNaviBar.dart';
import '../commanWidget/commanText.dart';
import '../widget/custom_container.dart';
import 'list.dart';

class PageViewScreen extends StatefulWidget {
  static const routeName = "/PageViewScreen";

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageScroll foodie = PageScroll();
  final _pageController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildPageView(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AppContainer(
                  /// navigator page
                  onTap: () {
                    Get.toNamed(BottomNavigatorController.routeName);
                  },
                  height: 7.h,
                  width: double.infinity,
                  color: AppColor.green,
                  child: const Center(
                    child: CustomeText(
                      title: AppString.next,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 100,
            left: 150,
            child: _buildStepIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        itemCount: foodie.categori.length,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
            child: Column(
              children: [
                AppContainer(
                  gradient: const LinearGradient(
                    end: Alignment(0.7, 0.9),
                    colors: <Color>[AppColor.white, AppColor.lightGreen],
                  ),
                  height: 30.h,
                  width: 60.w,
                  borderRadius: BorderRadius.circular(80),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                        "${foodie.categori[index][AppString.image]}"),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomeText(
                  title: "${foodie.categori[index][AppString.name]}",
                  fontSize: 3.5.h,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
                    CustomeText(
                      title: AppString.reading,
                      fontSize: 2.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomeText(
                      title: AppString.fantasy,
                      fontSize: 2.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  Widget _buildStepIndicator() {
    return CirclePageIndicator(
      itemCount: 3,
      dotSpacing: 3.w,
      selectedSize: 2.5.w,
      selectedDotColor: AppColor.green,
      dotColor: AppColor.grey,
      currentPageNotifier: _currentPageNotifier,
      size: 1.h,
      onPageSelected: (index) {
        if (_currentPageNotifier.value > index) {
          _pageController.initialPage;
        }
      },
    );
  }
}
