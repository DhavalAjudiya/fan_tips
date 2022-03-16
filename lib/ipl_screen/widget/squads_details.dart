<<<<<<< HEAD:lib/screen/ipl_screen/widget/squads_details.dart
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/T20Predictions/page/utills/string.dart';
import 'package:fantips/screen/ipl_screen/data/data_ipl.dart';
=======
>>>>>>> 5024a6b3c0b2c6a2142bf96e31458fced7ca9250:lib/ipl_screen/widget/squads_details.dart
import 'package:fantips/screen/more_screen/more_details_screen/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../T20Predictions/page/utills/color.dart';
import '../../../T20Predictions/page/utills/string.dart';
import '../../../utills/style.dart';
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
            Expanded(
              child: ListView.builder(
                itemCount: IplTems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: const ListTile(
                      leading: CircleAvatar(),
                      title: Text('Player Name'),
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
