import 'package:get/get.dart';

import '../homeScreen/screen/homePage.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;

  final page = [HomeScreen(), MatchesScreen(), ExpertScreen(), MoreScreen()];
}
