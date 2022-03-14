import 'package:fantips/expert/screen.dart';
import 'package:fantips/homeScreen/screen/homePage.dart';
import 'package:fantips/matches/page/current_matches.dart';
import 'package:fantips/more/page/more_screen.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;

  final page = [
    HomeScreen(),
    MatchesScreen(),
    ExpertScreen(),
    MoreScreen(),
  ];
}
