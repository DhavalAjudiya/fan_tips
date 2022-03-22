import 'package:fantips/utills/string.dart';
import 'package:fantips/widget/app_bottom_sheet.dart';
import 'package:fantips/widget/google_sign_in_repo.dart';
import 'package:fantips/widget/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../T20Predictions/page/utills/asset.dart';
import '../T20Predictions/page/utills/color.dart';
import '../commanWidget/commanText.dart';
import '../expert/data/controller.dart';
import '../ipl_screen/controller/ipl_controller.dart';
import 'custom_container.dart';

class HeaderRow extends StatelessWidget {
  final IplController iplController = Get.put(IplController());
  final IpController ipController = Get.find();
  final String title;
  final GestureTapCallback? onTap;
  final Widget? child;
  HeaderRow({
    Key? key,
    this.title = "",
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeText(
          title: title,
          color: AppColor.whiteColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        Obx(
          () => InkWell(
            onTap: () {
              AppBottomSheet().bottomSheet(context);
            },
            child: ipController.isLoggedIn.value == false
                ? CustomeText(
                    title: AppString.login,
                    color: AppColor.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  )
                : GestureDetector(
                    onTap: () {
                      Get.to(ProfileScreen());
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.transparent,
                      radius: 12,
                      backgroundImage: NetworkImage(
                          "${ipController.userObj?.user?.photoURL}"),
                    ),
                  ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: onTap,
          child: child,
        ),
      ],
    );
  }
}
