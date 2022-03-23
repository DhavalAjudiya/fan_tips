import 'package:flutter/cupertino.dart';

import '../../../../T20Predictions/page/utills/color.dart';
import '../../../../utills/style.dart';

class FallWicket extends StatelessWidget {
  const FallWicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FractionColumnWidth(0.75),
        2: FractionColumnWidth(0.13),
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
          decoration: BoxDecoration(
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
          ],
        ),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rohit Sharma',
              textAlign: TextAlign.start,
              style: Appstyle.pointSub,
            ),
          ),
          Text(
            '10 - 5',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '3.1',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ishan kishan',
              textAlign: TextAlign.start,
              style: Appstyle.pointSub,
            ),
          ),
          Text(
            '50 - 0',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
          Text(
            '10.1',
            textAlign: TextAlign.center,
            style: Appstyle.pointSub,
          ),
        ]),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'S Yadav',
                textAlign: TextAlign.start,
                style: Appstyle.pointSub,
              ),
            ),
            Text(
              '21 - 1',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
            Text(
              '15.2',
              textAlign: TextAlign.center,
              style: Appstyle.pointSub,
            ),
          ],
        )
      ],
    );
  }
}
