import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../T20Predictions/page/utills/color.dart';
import '../../utills/style.dart';

class PointTableTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.h),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FractionColumnWidth(0.39),
          1: FractionColumnWidth(0.12),
          2: FractionColumnWidth(0.12),
          3: FractionColumnWidth(0.12),
          4: FractionColumnWidth(0.12),
          5: FractionColumnWidth(0.12),
        },
        border: TableBorder(
          horizontalInside: BorderSide(
            width: 1,
            color: AppColor.greyBackGround,
            style: BorderStyle.solid,
          ),
        ),
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "Teams",
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTitle,
                ),
              ),
              Text(
                'M',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'W',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'L',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'Points',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'NRR',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Chennai Super Kings',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Delhi Capitals',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Rajasthan Royals',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kolkata Knight Riders',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sunrisers Hyderabad',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Mumbai Indians',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kings Xl Punjab',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Gujaraj Titans',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lakhnav Super',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Royal Challengers Banglore',
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTableWhite,
                ),
              ),
              Text(
                '8',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '6',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '2',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '12',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
              Text(
                '0.547',
                textAlign: TextAlign.center,
                style: Appstyle.pointTableWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
