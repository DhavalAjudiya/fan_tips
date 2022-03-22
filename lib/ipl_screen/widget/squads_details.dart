import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/more_screen/more_details_screen/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../T20Predictions/page/utills/color.dart';
import '../../../utills/style.dart';
import '../../more_screen/more_details_screen/custom_appbar.dart';
import '../../utills/string.dart';
import '../data/data_ipl.dart';

class SquadsDetailsScreen extends StatelessWidget {
  const SquadsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackGround,
      appBar: const CustomAppBar(
        title: 'Squads',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.batsman,
              style: Appstyle.moreStyle,
            ),
            Container(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: IplTems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: ListTile(
                      leading: Container(
                        height: 5.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            'assets/image/msdhoni.webp',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      title: Text('M.S Dhoni'),
                      trailing: SvgPicture.asset(
                        'assets/image/captain.svg',
                        height: 3.h,
                        width: 4.w,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
