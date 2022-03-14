import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_appbar.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: const CustomAppBar(
        title: AppString.experts,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "You haven't added favorite experts",
              style: TextStyle(fontFamily: 'WorkSan', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
          )
        ],
      ),
    );
  }
}
