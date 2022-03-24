import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'list.dart';

class PageViewController extends GetxController {
  PageScroll pageView = PageScroll();
  RxInt pageSelect = 0.obs;
  final pageController = PageController(initialPage: 0);
  //final currentPageNotifier = ValueNotifier(2);
}
