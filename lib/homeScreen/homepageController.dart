import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt bannerSelect = 0.obs;
  PageController pageController = PageController(initialPage: 0);
}
