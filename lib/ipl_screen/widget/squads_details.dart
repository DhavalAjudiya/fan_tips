import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:fantips/screen/more_screen/more_details_screen/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utills/style.dart';
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
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: IplTems.length,
                itemBuilder: (context, index) {
                  print(IplTems[index]['batsman'][0]);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Container(
                      height: 10.h,
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text('${IplTems[index]['batsman'][0]["name"]}'),
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
