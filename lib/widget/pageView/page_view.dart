// import 'package:fantips/utills/string.dart';
// import 'package:fantips/widget/customContainer/custom_container.dart';
// import 'package:fantips/widget/customText/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:page_view_indicators/step_page_indicator.dart';
// import 'package:sizer/sizer.dart';
// import '../../utills/color.dart';
//
// class PageViewScreen extends StatefulWidget {
//   static const routeName = "/PageViewScreen";
//
//   @override
//   State<PageViewScreen> createState() => _PageViewScreenState();
// }
//
// class _PageViewScreenState extends State<PageViewScreen> {
//   final _pageController = PageController();
//   final _currentPageNotifier = ValueNotifier(0);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: [
//           Column(
//             children: [
//               _onePage(),
//               _twoPage(),
//               _threePage(),
//             ],
//           )
//         ],
//       ),
//     );
//
//     // onPageChanged: (int index) {
//     //   _currentPageNotifier.value = index;
//     // },
//   }
//
//   Widget _onePage() {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
//             child: Column(
//               children: [
//                 AppContainer(
//                   gradient: const LinearGradient(
//                     end: Alignment(0.7, 0.9),
//                     colors: <Color>[AppColor.white, AppColor.popti],
//                   ),
//                   height: 30.h,
//                   width: 60.w,
//                   borderRadius: BorderRadius.circular(80),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: SvgPicture.asset(
//                       "assets/image/solution.svg",
//                       //AppImage.solution,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 AppText(
//                   data: AppString.solution,
//                   fontSize: 3.5.h,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Column(
//                   children: [
//                     AppText(
//                       data: AppString.reading,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     AppText(
//                       data: AppString.fantasy,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 14.h),
//           AppContainer(
//             height: 7.5.h,
//             color: AppColor.green,
//             child: const Center(
//               child: AppText(
//                 data: AppString.next,
//                 color: AppColor.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _twoPage() {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
//             child: Column(
//               children: [
//                 AppContainer(
//                   gradient: const LinearGradient(
//                     end: Alignment(0.7, 0.9),
//                     colors: <Color>[AppColor.white, AppColor.popti],
//                   ),
//                   height: 30.h,
//                   width: 60.w,
//                   borderRadius: BorderRadius.circular(80),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: SvgPicture.asset(
//                       "assets/image/working.svg",
//                       //AppImage.solution,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 AppText(
//                   data: AppString.working,
//                   fontSize: 3.5.h,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Column(
//                   children: [
//                     AppText(
//                       data: AppString.reading,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     AppText(
//                       data: AppString.fantasy,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 14.h),
//           AppContainer(
//             height: 7.5.h,
//             color: AppColor.green,
//             child: const Center(
//               child: AppText(
//                 data: AppString.next,
//                 color: AppColor.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _threePage() {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20, left: 20, top: 120),
//             child: Column(
//               children: [
//                 AppContainer(
//                   gradient: const LinearGradient(
//                     end: Alignment(0.7, 0.9),
//                     colors: <Color>[AppColor.white, AppColor.popti],
//                   ),
//                   height: 30.h,
//                   width: 60.w,
//                   borderRadius: BorderRadius.circular(80),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: SvgPicture.asset(
//                       "assets/image/mindset.svg",
//                       //AppImage.solution,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 AppText(
//                   data: AppString.mindset,
//                   fontSize: 3.5.h,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Column(
//                   children: [
//                     AppText(
//                       data: AppString.reading,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     AppText(
//                       data: AppString.fantasy,
//                       fontSize: 2.h,
//                       color: AppColor.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 14.h),
//           AppContainer(
//             height: 7.5.h,
//             color: AppColor.green,
//             child: const Center(
//               child: AppText(
//                 data: AppString.next,
//                 color: AppColor.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildStepIndicator() {
//   //   return Container(
//   //     color: Colors.black,
//   //     child: StepPageIndicator(
//   //       itemCount: 3,
//   //       currentPageNotifier: _currentPageNotifier,
//   //       size: 16,
//   //       onPageSelected: (int index) {
//   //         if (_currentPageNotifier.value > index)
//   //           _pageController.jumpToPage(index);
//   //       },
//   //     ),
//   //   );
//   // }
// }
