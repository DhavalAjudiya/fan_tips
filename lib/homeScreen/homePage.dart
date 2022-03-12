// import 'package:fantips/commanWidget/commanText.dart';
// import 'package:fantips/utills/color.dart';
// import 'package:fantips/utills/string.dart';
// import 'package:fantips/widget/customContainer/custom_container.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class HomeScreen extends StatelessWidget {
//   static const routeName = "/HomeScreen";
//
//   HomeScreen({Key? key}) : super(key: key);
//   int bannerSelect = 0;
//   PageController pageController = PageController(initialPage: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 8.sp),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomeText(
//                     title: AppString.fanTips,
//                     color: AppColor.whiteColor,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16.sp,
//                   ),
//                   CustomeText(
//                     title: AppString.logIn,
//                     color: AppColor.greenColor,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 12.sp,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 2.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 8.sp),
//               child: CustomeText(
//                 title: AppString.matchesForYou,
//                 color: AppColor.whiteColor,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 12.sp,
//               ),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             SizedBox(
//               height: 18.h,
//               child: PageView.builder(
//                 controller: pageController,
//                 onPageChanged: (value) {
//                   // setState(() {
//                   //   bannerSelect = value;
//                   // });
//                 },
//                 itemCount: 4,
//                 itemBuilder: (BuildContext context, int index) {
//                   return AppContainer(
//                     margin: EdgeInsets.symmetric(horizontal: 8.sp),
//                     borderRadius: BorderRadius.circular(10.sp),
//                     color: AppColor.blackColor,
//                     child: Padding(
//                       padding: EdgeInsets.all(8.sp),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomeText(
//                             title: AppString.zimbabevsAfghhanistan,
//                             color: AppColor.whiteColor,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12.sp,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 3,
//                 (index) => Container(
//                   height: 2.h,
//                   width: 2.w,
//                   margin: const EdgeInsets.symmetric(horizontal: 2),
//                   decoration: BoxDecoration(
//                       color: bannerSelect == index
//                           ? Colors.black.withOpacity(0.5)
//                           : Colors.grey,
//                       shape: BoxShape.circle),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
