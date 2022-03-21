import 'package:fantips/ipl_screen/controller/ipl_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../T20Predictions/page/utills/asset.dart';
import '../../utills/style.dart';
import 'custom_scoretile.dart';

class MatchTab extends StatelessWidget {

  final IplController iplController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 1.2.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // time
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tomorrow,', style: Appstyle.deadLineStyle),
                Text(' 15 May', style: Appstyle.deadLineStyle),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            // card
            IplCardMatches(
              onTap: () {
                if (iplController.isOn.value == false) {
                  iplController.isOn.value = true;
                } else {
                  iplController.isOn.value = false;
                }
              },
              icon: iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
              width: 88.w,
              titleMatches: 'RR vc RCB IPL,2021',
              image1: IconAsset.logoCSK,
              textTeam1: 'CSK',
              score1: "168/4",
              over1: '(20)',
              image2: IconAsset.logoMI,
              textTeam2: 'MI',
              score2: "130/5",
              over2: '(18.3)',
              totalPrediction: '72',
              prediction: 'Prediction',
              time: 'Match Starts in 5:45',
            ),
            SizedBox(
              height: 1.3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('sunday,', style: Appstyle.deadLineStyle),
                Text(' 16 May', style: Appstyle.deadLineStyle),
              ],
            ),
            SizedBox(
              height: 1.3.h,
            ),
            SizedBox(
              height: 38.h,
              width: 88.w,
              child: ListView.builder(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.3.h),
                    child: UpcomingIpl(
                      width: 88.w,
                      onTap: () {
                        if (iplController.isOn.value == false) {
                          iplController.isOn.value = true;
                        } else {
                          iplController.isOn.value = false;
                        }
                      },
                      icon:
                      iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
                      titleMatches: 'RCB vc DC IPL,2021',
                      image1: IconAsset.logoRCB,
                      textTeam1: 'RCB',
                      image2: IconAsset.logoDC,
                      textTeam2: 'DC',
                      time: '06:00 PM',
                      dayAgo: 'Match Start in 2 Days',
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1.3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('sunday,', style: Appstyle.deadLineStyle),
                Text(' 16 May', style: Appstyle.deadLineStyle),
              ],
            ),
            SizedBox(
              height: 1.3.h,
            ),
            SizedBox(
              height: 38.h,
              width: 88.w,
              child: ListView.builder(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.3.h),
                    child: UpcomingIpl(
                      onTap: () {
                        if (iplController.isOn.value == false) {
                          iplController.isOn.value = true;
                        } else {
                          iplController.isOn.value = false;
                        }
                      },
                      icon:
                      iplController.isOn.value == false ? const Icon(Icons.notifications) : const Icon(Icons.notifications_none_rounded),
                      width: 88.w,
                      titleMatches: 'PNJ vc KKR IPL,2021',
                      image1: IconAsset.logoPNJ,
                      textTeam1: 'PNJ',
                      image2: IconAsset.logoKKR,
                      textTeam2: 'KKR',
                      time: '06:00 PM',
                      dayAgo: 'Match Start in 2 Days',
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
