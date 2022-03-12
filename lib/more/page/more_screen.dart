import 'package:fantips/utills/color.dart';
import 'package:flutter/material.dart';

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
              "More Screen",
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
