import 'dart:io';
import 'package:fantips/expert/page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/commanText.dart';
import '../../homeScreen/data/homepageController.dart';
import '../../utills/string.dart';
import '../T20Predictions/prediction.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../../widget/header_row.dart';
import 'prediction_container.dart';
import '../data/controller.dart';

// ignore: must_be_immutable
class ExpertScreen extends StatelessWidget {
  static const routeName = "/ExpertScreen";
  IpController iplController = Get.put(IpController());
  final HomeController homeController = Get.put(HomeController());

  ExpertScreen({Key? key}) : super(key: key);
  Future<void> _refresh() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    iplController.refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              AppString.next,
              style: TextStyle(
                //   fontFamily: AppString.circle,
                fontSize: 15.sp,
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppString.wk,
                  style: TextStyle(
                    //    fontFamily: AppString.circle,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  AppString.news,
                  style: TextStyle(
                    //      fontFamily: AppStringcircle,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child:,
    );
  }
}
