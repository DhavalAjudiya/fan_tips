import 'package:fantips/screen/more_screen/more_details_screen/custom_appbar.dart';
import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SquadsDetailsScreen extends StatelessWidget {
  const SquadsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackGround,
      appBar: CustomAppBar(
        title: 'Punjab Kings',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.5.h,
            ),
            Text(
              'BATMAN',
              style: Appstyle.moreStyle,
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       return Row(
            //         children: [],
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
