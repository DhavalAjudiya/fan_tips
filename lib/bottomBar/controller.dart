import 'package:get/get.dart';

import '../expert/page/screen.dart';
import '../homeScreen/page/homePage.dart';
import '../matches/page/current_matches.dart';
import '../screen/ipl_screen/widget/ipl_screen.dart';
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
