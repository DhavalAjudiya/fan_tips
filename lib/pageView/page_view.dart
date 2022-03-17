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

  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageScroll foodie = PageScroll();
  final _pageController = PageController(viewportFraction: 3);
  final _currentPageNotifier = ValueNotifier(0);
  int pageSelector = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildPageView(),
              _nextContainer(),
            ],
          ),
          Positioned(
            bottom: 150,
            left: 200,
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
                      fontSize: 1.5.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomeText(
                      title: AppString.fantasy,
                      fontSize: 1.5.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        onPageChanged: (value) {
          _currentPageNotifier.value = value;
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

  Widget _nextContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AppContainer(
        /// navigator page
        onTap: () {
          _pageController.nextPage(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeIn);

          if (_currentPageNotifier.value == 2) {
            Get.toNamed(BottomNavigatorController.routeName);
          }
        },
        height: 6.h,
        width: double.infinity,
        color: AppColor.green,
        child: Center(
          child: CustomeText(
            title: AppString.next,
            color: AppColor.white,
            fontSize: 1.5.h,
          ),
        ),
      ),
    );
  }
}
