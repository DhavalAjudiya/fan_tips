import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_page';
  // SearchController _searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.black,
    //     body: Column(
    //       children: [
    //         _search(),
    //         SizedBox(
    //           height: 2.h,
    //         ),
    //         _contain(),
    //       ],
    //     ),
    //   ),
    // );
  }

  // Widget _search() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
  //     child: AppTextFormField(
  //       contentPadding:
  //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //       controller: _searchController.controller,
  //       onChanged: (value) => _searchController.fetchProducts(value: value),
  //       suffixIcon: AppIconCustom(
  //         onPressed: () {
  //           _searchController.controller.clear();
  //         },
  //         icon: AppIcon.clos,
  //         color: AppColor.white,
  //       ),
  //       prefixIcon: AppIconCustom(
  //         onPressed: () {},
  //         icon: AppIcon.backArrow,
  //         color: AppColor.white,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(40),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(40),
  //       ),
  //       fillColor: AppColor.grey1,
  //       border: OutlineInputBorder(),
  //       hintText: AppList.search,
  //       hintStyle: const TextStyle(
  //         color: AppColor.white,
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _vector() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       CircleAvatar(
  //         child: Image.asset(
  //           AppImage.match,
  //         ),
  //         backgroundColor: AppColor.red,
  //         radius: 70,
  //       ),
  //       SizedBox(
  //         height: 2.h,
  //       ),
  //       const Text(
  //         AppList.noMatch,
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: AppColor.white,
  //           fontSize: 20,
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _contain() {
  //   return Expanded(
  //     child: Obx(
  //           () {
  //         if (_searchController.controller.text.isEmpty) {
  //           return Center(
  //             child: _vector(),
  //           );
  //         } else if (_searchController.service.value.tipsters!.isNotEmpty) {
  //           return ListView.builder(
  //             itemCount: _searchController.service.value.tipsters!.length,
  //             itemBuilder: (context, index) {
  //               var item = _searchController.service.value.tipsters![index];
  //               return Padding(
  //                 padding:
  //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                 child: AppContainer(
  //                   onTap: () {},
  //                   height: 17.h,
  //                   width: double.infinity,
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: AppColor.greyBlack,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(10),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundImage: NetworkImage(
  //                                 "${item.profileUrl}",
  //                               ),
  //                               radius: 3.2.h,
  //                             ),
  //                             SizedBox(width: 3.w),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Container(
  //                                   height: 1.5.h,
  //                                   width: 50.w,
  //                                   child: AppCustomText(
  //                                     data: "${item.name}",
  //                                     // "${_searchController.service!.tipsters![0].name}",
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 1.5.h,
  //                                     color: AppColor.white,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 0.5.h,
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     Image(
  //                                       image: const AssetImage(
  //                                         AppImage.sign,
  //                                       ),
  //                                       height: 1.3.h,
  //                                     ),
  //                                     SizedBox(
  //                                       width: 1.w,
  //                                     ),
  //                                     AppCustomText(
  //                                       data: "${item.subscriberCount}",
  //                                       //"${_searchController.service!.tipsters![0].subscriberCount}",
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 1.2.h,
  //                                       color: AppColor.greya,
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                             Spacer(),
  //                             Obx(
  //                                   () => AppIconCustom(
  //                                 onPressed: () {
  //                                   _searchController.service.value
  //                                       .tipsters![index].selected.value =
  //                                   !_searchController.service.value
  //                                       .tipsters![index].selected.value;
  //                                 },
  //                                 color: _searchController.service.value
  //                                     .tipsters![index].selected.value
  //                                     ? AppColor.grey
  //                                     : AppColor.green,
  //                                 icon: AppIcon.favorite,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: [
  //                             Column(
  //                               children: [
  //                                 AppCustomText(
  //                                   data: "${item.totalPredictions}",
  //                                   color: AppColor.greya,
  //                                   fontSize: 3.h,
  //                                 ),
  //                                 AppCustomText(
  //                                   data: AppList.prediction,
  //                                   color: AppColor.greya,
  //                                   fontSize: 1.5.h,
  //                                 ),
  //                               ],
  //                             ),
  //                             AppContainer(
  //                               height: 5.h,
  //                               width: 0.1.w,
  //                               color: AppColor.grey,
  //                             ),
  //                             Column(
  //                               children: [
  //                                 AppCustomText(
  //                                   data: "${item.avgScore}",
  //                                   color: AppColor.greya,
  //                                   fontSize: 3.h,
  //                                 ),
  //                                 AppCustomText(
  //                                   data: AppList.avregescor,
  //                                   color: AppColor.greya,
  //                                   fontSize: 1.5.h,
  //                                 ),
  //                               ],
  //                             ),
  //                             AppContainer(
  //                               height: 5.h,
  //                               width: 0.1.w,
  //                               color: AppColor.grey,
  //                             ),
  //                             Column(
  //                               children: [
  //                                 AppCustomText(
  //                                   data: "${item.top3}",
  //                                   color: AppColor.greya,
  //                                   fontSize: 3.h,
  //                                 ),
  //                                 AppCustomText(
  //                                   data: AppList.wins,
  //                                   color: AppColor.greya,
  //                                   fontSize: 1.5.h,
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         } else {
  //           return Center(
  //             child: _vector(),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
