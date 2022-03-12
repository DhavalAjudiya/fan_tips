import 'package:fantips/utills/string.dart';
import 'package:fantips/widget/customContainer/custom_container.dart';
import 'package:fantips/widget/customText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../utills/color.dart';
import 'list.dart';

class PageViewScreen extends StatefulWidget {
  static const routeName = "/PageViewScreen";

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  Foodie foodie = Foodie();
  final _pageController = PageController(initialPage: 3);
  final _currentPageNotifier = ValueNotifier(3);
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
                    //Get.toNamed()
                  },
                  height: 7.h,
                  width: double.infinity,
                  color: AppColor.green,
                  child: Center(
                    child: AppText(
                      data: AppString.next,
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
        itemCount: 3,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
            child: Container(
              child: Column(
                children: [
                  AppContainer(
                    gradient: LinearGradient(
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
                  AppText(
                    data: "${foodie.categori[index][AppString.name]}",
                    fontSize: 3.5.h,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      AppText(
                        data: AppString.reading,
                        fontSize: 2.h,
                        color: AppColor.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        data: AppString.fantasy,
                        fontSize: 2.h,
                        color: AppColor.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
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
      onPageSelected: (int index) {
        if (_currentPageNotifier.value > index)
          _pageController.jumpToPage(index);
      },
    );
  }
}
