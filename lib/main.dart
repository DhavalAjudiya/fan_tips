import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fantips/pageView/page_view.dart';
import 'package:fantips/widget/splash_controller.dart';
import 'package:fantips/widget/splash_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'T20Predictions/prediction.dart';
import 'bottomBar/bottomNaviBar.dart';
import 'expert/page/screen.dart';
import 'homeScreen/page/homePage.dart';
import 'homeScreen/page/newsDetailedPage.dart';
import 'pageView/page_view.dart';
import 'widget/splash_controller.dart';
import 'widget/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialBinding: AppBiding(),
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => SplashScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: PageViewScreen.routeName,
              page: () => PageViewScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: BottomNavigatorController.routeName,
              page: () => BottomNavigatorController(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: HomeScreen.routeName,
              page: () => HomeScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: NewsDetailedScreen.routeName,
              page: () => NewsDetailedScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: ExpertScreen.routeName,
              page: () => ExpertScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: T20Prediction.routeName,
              page: () => T20Prediction(),
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
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
