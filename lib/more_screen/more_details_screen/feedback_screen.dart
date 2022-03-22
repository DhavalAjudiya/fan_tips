import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/widget/more_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:sizer/sizer.dart';

import '../../../T20Predictions/page/utills/color.dart';
import '../../../utills/string.dart';
import '../../../utills/style.dart';
import 'controller.dart';
import 'custom_appbar.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({Key? key}) : super(key: key);

  final MoreController moreController = Get.put(MoreController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackGround,
      appBar: const CustomAppBar(
        title: AppString.feedBack,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoreTextField(
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(AppString.experience, style: Appstyle.moreStyle),
                SizedBox(
                  height: 6.w,
                ),
                ReviewSlider(
                  options: const ['Terrible', 'Bad', 'Okay', 'Good', 'Great'],
                  optionStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WorkSon'),
                  onChange: moreController.onChange1,
                ),
                // Text(
                //   moreController.selectedValue1.toString(),
                // ),
                SizedBox(
                  height: 6.w,
                ),
                Text(
                  AppString.feedBack,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WorkSon',
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                MoreTextField(
                  textInputType: TextInputType.text,
                  maxLines: 3,
                  hint: AppString.enterFeedback,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Feedback should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 60.w,
                ),
                MoreButtonScreen(
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: AppString.sendFeedback,
                ),
                SizedBox(
                  height: 7.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
