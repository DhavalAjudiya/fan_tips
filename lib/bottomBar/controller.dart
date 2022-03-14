import 'package:get/get.dart';

import '../expert/screen.dart';
import '../homeScreen/screen/homePage.dart';
import '../matches/page/current_matches.dart';
import '../more/page/more_screen.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;

  final page = [
    HomeScreen(),
    MatchesScreen(),
    ExpertScreen(),
    MoreScreen(),
  ];
}
