import 'package:fantips/homeScreen/page/newsScreen.dart';
import 'package:fantips/pageView/page_view.dart';
import 'package:fantips/widget/splash_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'T20Predictions/page/prediction.dart';
import 'bottomBar/bottomNaviBar.dart';
import 'homeScreen/page/newsDetailedPage.dart';
import 'expert/page/screen.dart';
import 'homeScreen/page/homePage.dart';
import 'ipl_screen/page/ipl_screen.dart';
import 'ipl_screen/widget/upcoming_matches.dart';
import 'matches/page/current_matches.dart';
import 'matches/widget/upcoming_matches/page/upcoming_match_page.dart';
import 'pageView/page_view.dart';
import 'screen/ipl_screen/page/upcoming_matches.dart';
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
          initialRoute: UpcomingIplPage.routeName,
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
              name: MatchesScreen.routeName,
              page: () => MatchesScreen(),
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
              name: IplScreen.routeName,
              page: () => IplScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: NewsDetailedScreen.routeName,
              page: () => NewsDetailedScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: NewsScreen.routeName,
              page: () => NewsScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: UpcomingMatchScreen.routeName,
              page: () => UpcomingMatchScreen(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: UpcomingIplPage.routeName,
              page: () => UpcomingIplPage(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: MatchesScreen.routeName,
              page: () => MatchesScreen(),
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
