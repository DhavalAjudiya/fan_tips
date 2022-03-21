
import 'package:fantips/T20Predictions/page/utills/color.dart';
import 'package:flutter/material.dart';

import '../../utills/string.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              AppString.moreScreen,
              style: TextStyle(
                color: AppColor.greenColor,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}