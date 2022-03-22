import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/utills/style.dart';
import 'package:fantips/widget/more_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/string.dart';
import 'custom_appbar.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackGround,
      appBar: const CustomAppBar(
        title: AppString.contactBranding,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                MoreTextField(
                  textInputType: TextInputType.name,
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name number should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                MoreTextField(
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email / Mobile number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Contact number or email should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                MoreTextField(
                  textInputType: TextInputType.url,
                  labelText: 'Application link',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Application link should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(AppString.description, style: Appstyle.moreStyle),
                MoreTextField(
                  textInputType: TextInputType.text,
                  maxLines: 4,
                  hint: AppString.enterDescription,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description should not be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 27.h,
                ),
                MoreButtonScreen(
                  text: 'Submit',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.back();
                    }
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
