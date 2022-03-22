import 'package:fantips/screen/ipl_screen/widget/fantasyTabBar/utils/icon.dart';
import 'package:fantips/screen/ipl_screen/widget/fantasyTabBar/wight/icon/icon_button.dart';
import 'package:fantips/screen/ipl_screen/widget/fantasyTabBar/wight/text/custom_text.dart';
import 'package:fantips/screen/ipl_screen/widget/fantasyTabBar/wight/text/text_from_fild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../T20Predictions/page/utills/asset.dart';
import '../../../../T20Predictions/page/utills/color.dart';
import '../../../../ipl_screen/controller/ipl_controller.dart';
import '../../../../utills/string.dart';
import '../../../../widget/custom_container.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/SearchScreen';
  final IplController iplController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            _search(),
            SizedBox(
              height: 2.h,
            ),
            _contain(),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: AppTextFormField(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        controller: iplController.controller,
        onChanged: (value) => iplController.fetchProducts(value: value),
        suffixIcon: AppIconCustom(
          onPressed: () {
            iplController.controller.clear();
          },
          icon: AppIcon.clos,
          color: AppColor.white,
        ),
        prefixIcon: AppIconCustom(
          onPressed: () {
            Get.back();
          },
          icon: AppIcon.backArrow,
          color: AppColor.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        fillColor: AppColor.grey1,
        border: const OutlineInputBorder(),
        hintText: AppString.search,
        hintStyle: const TextStyle(
          color: AppColor.white,
        ),
      ),
    );
  }

  Widget _vector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset(
            AppImage.matchNot,
          ),
          backgroundColor: AppColor.red,
          radius: 70,
        ),
        SizedBox(
          height: 2.h,
        ),
        const Text(
          AppString.notFount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _contain() {
    return Expanded(
      child: Obx(
        () {
          // print("data=>>${iplController.service.value.tipsters!.length}");
          if (iplController.controller.text.isEmpty) {
            return Center(
              child: _vector(),
            );
          } else if (iplController.service.value.tipsters!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: iplController.service.value.tipsters!.length,
                itemBuilder: (context, index) {
                  //log("data=>>${iplController.service.value.tipsters!.length}");
                  var item = iplController.service.value.tipsters![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: AppContainer(
                      onTap: () {},
                      height: 15.h,
                      width: double.infinity,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.greyBlack,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    item.profileUrl ?? "",
                                  ),
                                  radius: 3.2.h,
                                ),
                                SizedBox(width: 3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 1.5.h,
                                      width: 50.w,
                                      child: AppCustomText(
                                        data: item.name ?? "",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 1.5.h,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                            AppImage.youtube,
                                          ),
                                          height: 1.3.h,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        AppCustomText(
                                          data: "${item.subscriberCount ?? 0}",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 1.2.h,
                                          color: AppColor.greya,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                AppIconCustom(
                                  onPressed: () {
                                    iplController.service.value.tipsters![index]
                                            .selected.value =
                                        !iplController.service.value
                                            .tipsters![index].selected.value;
                                  },
                                  color: iplController.service.value
                                          .tipsters![index].selected.value
                                      ? AppColor.grey
                                      : AppColor.green,
                                  icon: AppIcon.favorite,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    AppCustomText(
                                      data: "${item.totalPredictions ?? 0}",
                                      color: AppColor.greya,
                                      fontSize: 3.h,
                                    ),
                                    AppCustomText(
                                      data: AppString.prediction,
                                      color: AppColor.greya,
                                      fontSize: 1.5.h,
                                    ),
                                  ],
                                ),
                                AppContainer(
                                  height: 5.h,
                                  width: 0.1.w,
                                  color: AppColor.grey,
                                ),
                                Column(
                                  children: [
                                    AppCustomText(
                                      data: "${item.avgScore ?? 0}",
                                      color: AppColor.greya,
                                      fontSize: 3.h,
                                    ),
                                    AppCustomText(
                                      data: AppString.avregescor,
                                      color: AppColor.greya,
                                      fontSize: 1.5.h,
                                    ),
                                  ],
                                ),
                                AppContainer(
                                  height: 5.h,
                                  width: 0.1.w,
                                  color: AppColor.grey,
                                ),
                                Column(
                                  children: [
                                    AppCustomText(
                                      data: "${item.top3 ?? 0}",
                                      color: AppColor.greya,
                                      fontSize: 3.h,
                                    ),
                                    AppCustomText(
                                      data: AppString.wins,
                                      color: AppColor.greya,
                                      fontSize: 1.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: _vector(),
            );
          }
        },
      ),
    );
  }
}
