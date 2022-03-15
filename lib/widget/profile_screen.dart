import 'dart:io';
import 'package:fantips/utills/color.dart';
import 'package:fantips/utills/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../expert/data/controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  IpController ipController = Get.find();
  XFile? pickedImageFile;
  var selectedImagePath = ''.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColorBlack,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: AppColor.grey,
                        ),
                      ),
                      Text(
                        AppString.profile,
                        style: TextStyle(
                          fontFamily: "Circular",
                          fontSize: 17.5.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppString.logout,
                          style: TextStyle(
                            fontFamily: "Circular",
                            fontSize: 13.sp,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CircleAvatar(
                  radius: 62,
                  child: pickedImageFile != null
                      ? ClipOval(
                          child: Image.file(
                            File(pickedImageFile!.path),
                            fit: BoxFit.cover,
                            width: 50.h,
                          ),
                        )
                      : ClipOval(
                          child: Image.network(
                            "${ipController.userObj?.user?.photoURL}",
                            fit: BoxFit.cover,
                            width: 50.h,
                          ),
                        ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 13,
                      left: 13,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: AppColor.white,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 27,
                            ),
                            prefixIcon: const Icon(
                              Icons.contact_mail,
                              color: AppColor.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            fillColor: AppColor.containerBackground,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: "Name",
                            labelStyle: const TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          cursorColor: AppColor.white,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: AppColor.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 27,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            fillColor: AppColor.containerBackground,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: "Username",
                            labelStyle: const TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          cursorColor: AppColor.white,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.contact_phone,
                              color: AppColor.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 27,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            fillColor: AppColor.containerBackground,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: "Phone Number",
                            prefixText: "+91",
                            labelStyle: const TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 7.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                            color: AppColor.containerBackground,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Center(
                            child: Text(
                              AppString.submit,
                              style: TextStyle(
                                color: AppColor.greenColor,
                                fontFamily: "Circular",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 144.sp,
              left: 168.sp,
              child: InkWell(
                onTap: () async {
                  pickImage();
                },
                child: const CircleAvatar(
                  radius: 17,
                  child: Icon(Icons.photo_camera),
                  backgroundColor: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    final picker = ImagePicker();
    // final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(
        () {
          pickedImageFile = pickedImage;
        },
      );
    }
  }
}
