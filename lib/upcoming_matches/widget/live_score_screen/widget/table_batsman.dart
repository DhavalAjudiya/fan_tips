import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../T20Predictions/page/utills/color.dart';
import '../../../../utills/style.dart';

class TableBatsMan extends StatelessWidget {
  const TableBatsMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 1,
            color: AppColor.greyBackGround,
            style: BorderStyle.solid,
          ),
        ),
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: AppColor.greyBackGround,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "BATSMAN",
                  textAlign: TextAlign.start,
                  style: Appstyle.pointTitle,
                ),
              ),
              Text(
                'R',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'B',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                '4s',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                '6s',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
              Text(
                'S/R',
                textAlign: TextAlign.center,
                style: Appstyle.pointTitle,
              ),
            ],
          ),
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rohit Sharma',
                    textAlign: TextAlign.center,
                    style: Appstyle.pointSub,
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                  Text(
                    'Run out',
                    textAlign: TextAlign.center,
                    style: Appstyle.pointSub,
                  ),
                ],
              ),
            ),
            Text(
              '19',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '15',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ishan Kishan',
                    textAlign: TextAlign.center,
                    style: Appstyle.pointSub,
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                  Text(
                    'Batting',
                    textAlign: TextAlign.center,
                    style: Appstyle.pointSub,
                  ),
                ],
              ),
            ),
            Text(
              '19',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '15',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
          ]),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'S Yadav',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointSub,
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    Text(
                      'Run out',
                      textAlign: TextAlign.center,
                      style: Appstyle.pointSub,
                    ),
                  ],
                ),
              ),
              Text(
                '19',
                textAlign: TextAlign.center,
                style: Appstyle.pointSub,
              ),
              Text(
                '15',
                textAlign: TextAlign.center,
                style: Appstyle.pointSub,
              ),
              Text(
                '1',
                textAlign: TextAlign.center,
                style: Appstyle.pointSub,
              ),
              Text(
                '1',
                textAlign: TextAlign.center,
                style: Appstyle.pointSub,
              ),
              Text(
                '1',
                textAlign: TextAlign.center,
                style: Appstyle.pointSub,
              ),
            ],
          )
        ],
      ),
    );
  }
}
