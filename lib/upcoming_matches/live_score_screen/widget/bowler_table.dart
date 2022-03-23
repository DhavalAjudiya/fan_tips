import 'package:flutter/cupertino.dart';

import '../../../../T20Predictions/page/utills/color.dart';
import '../../../../utills/style.dart';

class BowlerTable extends StatelessWidget {
  const BowlerTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
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
                "BOWLER",
                textAlign: TextAlign.start,
                style: Appstyle.pointTitle,
              ),
            ),
            Text(
              'O',
              textAlign: TextAlign.center,
              style: Appstyle.pointTitle,
            ),
            Text(
              'M',
              textAlign: TextAlign.center,
              style: Appstyle.pointTitle,
            ),
            Text(
              'R',
              textAlign: TextAlign.center,
              style: Appstyle.pointTitle,
            ),
            Text(
              'W',
              textAlign: TextAlign.center,
              style: Appstyle.pointTitle,
            ),
            Text(
              'ECO',
              textAlign: TextAlign.center,
              style: Appstyle.pointTitle,
            ),
          ],
        ),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'A Milne',
              textAlign: TextAlign.start,
              style: Appstyle.pointSub,
            ),
          ),
          Text(
            '4',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '0',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '25',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '2',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '7',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'R Jadeja',
              textAlign: TextAlign.start,
              style: Appstyle.pointSub,
            ),
          ),
          Text(
            '4',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '0',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '31',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '1',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '8',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
        ]),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Deepak Cahhar',
                textAlign: TextAlign.start,
                style: Appstyle.pointSub,
              ),
            ),
            Text(
              '3',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '0',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '15',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '3',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '4',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
          ],
        )
      ],
    );
  }
}
