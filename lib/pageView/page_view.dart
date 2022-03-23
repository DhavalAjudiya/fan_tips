import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bottomBar/bottomNaviBar.dart';
import '../commanWidget/commanText.dart';
import '../utills/string.dart';
import '../widget/custom_container.dart';
import 'page_view_controller.dart';

class PageViewScreen extends StatelessWidget {
  static const routeName = "/PageViewScreen";
  final _pageViewController = Get.put(PageViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildPageView(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppContainer(
                  /// navigator page
                  onTap: () {
                    _pageViewController.pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn);

                    if (_pageViewController.pageSelect == 2) {
                      Get.toNamed(BottomNavigatorController.routeName);
                    }
                  },
                  height: 6.h,
                  width: double.infinity,
                  color: AppColor.green,
                  child: Center(
                    child: CustomeText(
                      title: _pageViewController.pageSelect == 2
                          ? "Get Started"
                          : "Next",
                      color: AppColor.white,
                      fontSize: 2.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,
            right: 40.w,
            child: _buildStepIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageViewController.pageController,
        onPageChanged: (value) {
          _pageViewController.pageSelect = value;
        },
        itemCount: _pageViewController.pageView.categori.length,
        itemBuilder: (BuildContext context, index) {
          final page = _pageViewController.pageView.categori[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 200),
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
                        child: SvgPicture.asset("${page[AppString.image]}"),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomeText(
                      title: "${page[AppString.name]}",
                      fontSize: 2.5.h,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      children: [
                        CustomeText(
                          title: AppString.reading,
                          fontSize: 1.8.h,
                          color: AppColor.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomeText(
                          title: AppString.fantasy,
                          fontSize: 1.8.h,
                          color: AppColor.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStepIndicator() {
    return SmoothPageIndicator(
      controller: _pageViewController.pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
        spacing: 2.w,
        radius: 1.h,
        dotWidth: _pageViewController.pageSelect == 3 ? 1.h : 4.5.w,
        dotHeight: 1.h,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 0.5.w,
        dotColor: Colors.grey,
        activeDotColor: Colors.green,
      ),
    );
  }
}
