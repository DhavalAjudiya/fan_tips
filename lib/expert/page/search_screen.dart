import 'dart:developer';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/expert/data/controller.dart';
import 'package:fantips/expert/page/prediction_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';

class Search extends StatelessWidget {
  IpController iplController = Get.find();
  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
          () {
            print(iplController.expert.value.tipsters?.length);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColor.grey.shade600,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: iplController.searchController,
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        iplController.searchItem.clear();
                        for (var i = 0;
                            i <
                                (iplController.expert.value.tipsters?.length ??
                                    0);
                            i++) {
                          if (iplController.expert.value.tipsters![i].name!
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            iplController.searchItem
                                .add(iplController.expert.value.tipsters![i]);
                          }
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close, color: AppColor.white),
                          onPressed: () {
                            iplController.searchController.clear();
                            iplController.searchItem.clear();
                          },
                        ),
                        contentPadding: const EdgeInsets.all(7),
                        hintText: "Search",
                        prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () {
                    log("length=====>>>${iplController.searchItem.length}");
                    return iplController.searchController.value.text.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 50.sp,
                                ),
                                const CustomeText(
                                  title: "No Experts Found",
                                  fontSize: 25,
                                ),
                              ],
                            ),
                          )
                        : iplController
                                    .searchController.value.text.isNotEmpty &&
                                iplController.searchItem.value.isEmpty
                            ? Column(
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 50.sp,
                                  ),
                                  const CustomeText(title: "No Experts Found"),
                                ],
                              )
                            : Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: iplController.searchItem.length,
                                    itemBuilder: (context, index) {
                                      log("length=====>>>${iplController.searchItem.length}");
                                      var postData =
                                          iplController.searchItem.value[index];
                                      return Obx(
                                        () => PredictionContainer(
                                          predictionCount:
                                              "${postData.totalPredictions}",
                                          onPressed: () {
                                            if (postData.wishlist.value ==
                                                false) {
                                              postData.wishlist.value = true;
                                            } else {
                                              postData.wishlist.value = false;
                                            }
                                          },
                                          icon: postData.wishlist.value == false
                                              ? const Icon(
                                                  Icons.favorite_border,
                                                  color: AppColor.green)
                                              : const Icon(Icons.favorite,
                                                  color: AppColor.green),
                                          winsCount: "${postData.top3}",
                                          youtubeText:
                                              "${postData.subscriberCount}",
                                          averageCount: "${postData.avgScore}",
                                          headerText:
                                              '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                                          backgroundImage: NetworkImage(postData
                                                  .profileUrl ??
                                              "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png"),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
