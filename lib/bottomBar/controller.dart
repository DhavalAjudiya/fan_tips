import 'package:fantips/more_screen/more_screen.dart';
import 'package:get/get.dart';
import '../expert/page/screen.dart';
import '../homeScreen/page/homePage.dart';
import '../ipl_screen/page/ipl_screen.dart';
import '../matches/page/current_matches.dart';

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
