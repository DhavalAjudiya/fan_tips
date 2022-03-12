import 'package:get/get.dart';

import '../expert/page/screen.dart';
import '../homeScreen/homePage.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;

  final page = [
    HomeScreen(),
    // FixtureScreen(),
    ExpertScreen(),
    // const MoreScreen(),
  ];
}
