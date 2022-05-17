import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../T20Predictions/page/utills/asset.dart';
import '../../../T20Predictions/page/utills/color.dart';
import '../../../commanWidget/commanText.dart';
import '../../../utills/string.dart';
import '../../page/prediction_container.dart';
import '../blockCubit/cubit.dart';
import '../blockCubit/state_cubit.dart';
import '../repositoryBlock/search_screen.dart';

class ExpertBlockScreen extends StatefulWidget {
  @override
  State<ExpertBlockScreen> createState() => _ExpertBlockScreenState();
}

class _ExpertBlockScreenState extends State<ExpertBlockScreen> {
  late ExpertCubit expertCubit;
  // final List<Expert> _expert = [];
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    expertCubit = BlocProvider.of<ExpertCubit>(context)..expertFetchData("");

    expertCubit..expertFetchData("");
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        print("pixel =>${_scrollController.position.pixels}");
        expertCubit..expertFetchData("");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColorBlack,
        body: BlocBuilder<ExpertCubit, ExpertState>(
          bloc: expertCubit,
          builder: (context1, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text("Error-"),
              );
            } else if (state is LoadedState) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 9.sp, left: 13.5.sp, right: 12.5.sp, bottom: 4.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Prediction Experts",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 2.1.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            IconAsset.searchIcon,
                            height: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottom(context);
                      },
                      child: Container(
                        height: 5.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.containerBackgroundColor,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 58.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 0.2.h,
                                    width: 6.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.green,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.3.h,
                                  ),
                                  Container(
                                    height: 0.2.h,
                                    width: 4.5.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.green,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.3.h,
                                  ),
                                  Container(
                                    height: 0.2.h,
                                    width: 2.5.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.green,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppString.sortByAvgScore,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'circular',
                                    color: AppColor.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                CustomeText(
                                  title: AppString.prediction,
                                  color: AppColor.greenColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 10.h,
                        child: ListView.builder(
                          itemCount: state.expert.tipsters!.length,
                          itemBuilder: (context, index) {
                            var postData = state.expert.tipsters![index];
                            return PredictionContainer(
                              predictionCount: "${postData.totalPredictions}",
                              onPressed: () {
                                if (postData.wishlist.value == false) {
                                  postData.wishlist.value = true;
                                } else {
                                  postData.wishlist.value = false;
                                }
                              },
                              icon: postData.wishlist.value == false
                                  ? const Icon(Icons.favorite_border,
                                      color: AppColor.green)
                                  : const Icon(Icons.favorite,
                                      color: AppColor.green),
                              winsCount: "${postData.top3}",
                              youtubeText: "${postData.subscriberCount}",
                              averageCount: "${postData.avgScore}",
                              headerText:
                                  '${postData.name!.length >= 25 ? postData.name?.substring(0, 12) : postData.name}...',
                              backgroundImage: NetworkImage(
                                postData.profileUrl ??
                                    "https://png.pngtree.com/png-clipart/20211116/original/pngtree-round-country-flag-south-korea-png-image_6934026.png",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future showBottom(prinsh) {
    return showModalBottomSheet(
      context: prinsh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.sp),
          topRight: Radius.circular(12.sp),
        ),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<ExpertCubit>(prinsh),
          child: Container(
            height: 23.h,
            decoration: BoxDecoration(
              color: AppColor.containerBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, top: 10.sp, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImage.line,
                        color: AppColor.whiteColor,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CustomeText(
                        title: AppString.sortBy,
                        fontSize: 14.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.8.h,
                  ),
                  Divider(
                    height: 0.1.h,
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      CustomeText(
                        title: AppString.prediction,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                      ),
                      // const Spacer(),
                      // CircleAvatar(
                      //   radius: 8,
                      //   backgroundColor: AppColor.white,
                      //   child: Icon(
                      //     Icons.done,
                      //     size: 12,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Divider(
                    height: 0.1.h,
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    children: [
                      CustomeText(
                        title: AppString.average_score,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                        fontSize: 13.sp,
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColor.white,
                        child: Icon(
                          Icons.done,
                          size: 12,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Divider(
                    height: 0.1.h,
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    children: [
                      CustomeText(
                        title: AppString.wins,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                      ),
                      // const Spacer(),
                      // CircleAvatar(
                      //   radius: 8,
                      //   backgroundColor: AppColor.white,
                      //   child: Icon(Icons.done, size: 12),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
