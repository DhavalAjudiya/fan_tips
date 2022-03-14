import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:fantips/utills/style.dart';
import 'package:fantips/widget/more_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

import 'custom_appbar.dart';

class ApplyExpertScreen extends StatelessWidget {
  ApplyExpertScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackGround,
      appBar: const CustomAppBar(
        title: AppString.applyExpert,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              MoreTextField(
                labelText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name should not be blank';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              MoreTextField(
                labelText: 'Channel URL',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Channel url should not be blank';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              MoreTextField(
                labelText: 'Contact No ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact number should not be blank';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                AppString.description,
                  style: Appstyle.moreStyle
              ),
              MoreTextField(
                maxLines: 4,
                hint: AppString.enterDescription,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description should not be blank';
                  }
                  return null;
                },
              ),
              Spacer(),
              MoreButtonScreen(
                onTap: () {
                  if(_formKey.currentState!.validate()) {}
                },
                text: 'Submit',
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
