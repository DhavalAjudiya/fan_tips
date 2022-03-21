import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicators/step_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../utills/string.dart';
import '../custom_container.dart';

class PageViewScreen extends StatefulWidget {
  static const routeName = "/PageViewScreen";

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            children: [
              _onePage(),
              _twoPage(),
              _threePage(),
            ],
          )
        ],
      ),
    );
  }

  Widget _onePage() {
    return Container(
      child: Column(
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
                      "assets/image/solution.svg",
                      //AppImage.solution,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomeText(
                  title: AppString.solution,
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
                      fontSize: 1.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomeText(
                      title: AppString.fantasy,
                      fontSize: 1.h,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          AppContainer(
            height: 7.5.h,
            color: AppColor.green,
            child: const Center(
              child: CustomeText(
                title: AppString.next,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _twoPage() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
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
                      "assets/image/working.svg",
                      //AppImage.solution,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomeText(
                  title: AppString.working,
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
          ),
          SizedBox(height: 14.h),
          AppContainer(
            height: 7.5.h,
            color: AppColor.green,
            child: const Center(
              child: CustomeText(
                title: AppString.next,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _threePage() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
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
                      "assets/image/mindset.svg",
                      //AppImage.solution,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomeText(
                  title: AppString.mindset,
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
          ),
          SizedBox(height: 14.h),
          AppContainer(
            height: 7.5.h,
            color: AppColor.green,
            child: const Center(
              child: CustomeText(
                title: AppString.next,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      color: Colors.black,
      child: StepPageIndicator(
        itemCount: 3,
        currentPageNotifier: _currentPageNotifier,
        size: 16,
        onPageSelected: (int index) {
          if (_currentPageNotifier.value > index)
            _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
