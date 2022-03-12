import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'homeScreen/homePage.dart';

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
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialBinding: AppBiding(),
          initialRoute: HomeScreen.routeName,
          getPages: [
            // GetPage(
            //   name: SplashScreen.routeName,
            //   page: () => SplashScreen(),
            //   transition: Transition.rightToLeft,
            // ),
            GetPage(
              name: HomeScreen.routeName,
              page: () => HomeScreen(),
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
