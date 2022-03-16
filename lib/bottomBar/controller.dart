import 'package:get/get.dart';

import '../expert/page/screen.dart';
import '../homeScreen/page/homePage.dart';
import '../ipl_screen/page/ipl_screen.dart';
import '../matches/page/current_matches.dart';
<<<<<<< HEAD
import '../screen/ipl_screen/widget/ipl_screen.dart';
=======

>>>>>>> 5024a6b3c0b2c6a2142bf96e31458fced7ca9250
import '../screen/more_screen/more_screen.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;

  final page = [
    HomeScreen(),
    MatchesScreen(),
    IplScreen(),
    ExpertScreen(),
    MoreScreen(),
  ];
}
