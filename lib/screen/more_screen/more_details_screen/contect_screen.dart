import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/screen/more_screen/more_details_screen/custom_appbar.dart';
import 'package:fantips/utills/style.dart';
import 'package:fantips/widget/more_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
                    return 'Name number should not be blank';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              MoreTextField(
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
                maxLines: 4,
                hint: AppString.enterDescription,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description should not be blank';
                  }
                  return null;
                },
              ),
              const Spacer(),
              MoreButtonScreen(
                text: 'Submit',
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
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
