import 'dart:developer';
import 'package:fantips/commanWidget/commanText.dart';
import 'package:fantips/expert/data/controller.dart';
import 'package:fantips/expert/page/prediction_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';

class Search extends StatefulWidget {
  static const routeName = '/search_page';
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  IpController ipController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
          () {
            print(ipController.expert.value.tipsters?.length);
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
                      controller: ipController.searchController,
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        ipController.searchItem.clear();
                        for (var i = 0;
                            i <
                                (ipController.expert.value.tipsters?.length ??
                                    0);
                            i++) {
                          if (ipController.expert.value.tipsters![i].name!
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            ipController.searchItem
                                .add(ipController.expert.value.tipsters![i]);
                          }
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close, color: AppColor.white),
                          onPressed: () {
                            ipController.searchController.clear();
                            ipController.searchItem.clear();
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
                    log("length=====>>>${ipController.searchItem.length}");
                    return ipController.searchController.value.text.isEmpty
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
                        : ipController.searchController.value.text.isNotEmpty &&
                        // ignore: invalid_use_of_protected_member
                                ipController.searchItem.value.isEmpty
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
                                    itemCount: ipController.searchItem.length,
                                    itemBuilder: (context, index) {
                                      log("length=====>>>${ipController.searchItem.length}");
                                      var postData =
                                          // ignore: invalid_use_of_protected_member
                                          ipController.searchItem.value[index];
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
