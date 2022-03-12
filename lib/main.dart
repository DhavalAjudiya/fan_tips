import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'widget/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          initialBinding: AppBiding(),
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => SplashScreen(),
              transition: Transition.rightToLeft,
            ),
          ],
        );
      },
    );
  }
}

class AppBiding implements Bindings {
  @override
  void dependencies() {}
}
