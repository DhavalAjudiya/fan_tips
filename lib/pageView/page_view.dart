import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../bottomBar/bottomNaviBar.dart';
import '../commanWidget/commanText.dart';
import '../utills/string.dart';
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
  int matchSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildPageView(),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 160,
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
        onPageChanged: (value) {
          _currentPageNotifier.value = value;
        },
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
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
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AppContainer(
                  /// navigator page
                  onTap: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
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
                      title: "${foodie.categori[index]["next"]}",
                      color: AppColor.white,
                      fontSize: 1.8.h,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          height: 10,
          width: 0 == index ? 25 : 10,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index == 0 ? AppColor.greenColor : AppColor.blackColor,
          ),
          // child: CirclePageIndicator(
          //   itemCount: 3,
          //   dotSpacing: 3.w,
          //   selectedSize: 2.h,
          //   selectedDotColor: AppColor.green,
          //   dotColor: AppColor.grey,
          //   currentPageNotifier: _currentPageNotifier,
          //   size: 2.9.w,
          //   onPageSelected: (index) {
          //     if (_currentPageNotifier.value > index) {
          //       _pageController.initialPage;
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
