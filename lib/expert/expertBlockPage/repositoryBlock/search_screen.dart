import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../T20Predictions/page/utills/color.dart';
import '../../page/prediction_container.dart';
import '../blockCubit/cubit.dart';
import '../blockCubit/state_cubit.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  ExpertCubit? expertCubit;
  @override
  void initState() {
    expertCubit = BlocProvider.of<ExpertCubit>(context)..expertFetchData("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            decoration: BoxDecoration(
              color: AppColor.grey.shade600,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: searchController,
              cursorColor: Colors.white,
              onChanged: (value) {
                expertCubit?.expertFetchData(value);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: AppColor.white),
                  onPressed: () {},
                ),
                contentPadding: const EdgeInsets.all(7),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColor.white,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        body: BlocBuilder<ExpertCubit, ExpertState>(
          builder: (context, state) {
            log("state====>${state}");
            if (state is LoadingState) {
              return Center(
                child: Text(state.massage),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text("Error-"),
              );
            } else if (state is LoadedState) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 9.sp, left: 13.5.sp, right: 12.5.sp, bottom: 4.sp),
                child: Expanded(
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
                            : const Icon(Icons.favorite, color: AppColor.green),
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
