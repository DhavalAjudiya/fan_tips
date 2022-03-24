import 'package:fantips/ipl_screen/widget/squads_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/color.dart';
import '../data/data_ipl.dart';

class SquadTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: IplTems.length,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
          child: InkWell(
            onTap: () {
              Get.to(
                    () => const SquadsDetailsScreen(),
              );



            },
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  IplTems[index]['teamLogo'],
                ),
              ),
              title: Text(
                IplTems[index]['team'],
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'WorkSan',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              tileColor: AppColor.greyBackGround,
            ),
          ),
        );
      },
    );
  }
}
