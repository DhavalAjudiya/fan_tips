import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'list.dart';

class PageViewController extends GetxController {
  PageScroll pageView = PageScroll();
  int pageSelect = 0;
  final pageController = PageController(initialPage: 0);
  //final currentPageNotifier = ValueNotifier(2);
}
