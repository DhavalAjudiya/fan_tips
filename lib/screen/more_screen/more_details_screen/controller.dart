
import 'package:get/get.dart';

class MoreController extends GetxController {
  int? selectedValue1;
  int? selectedValue2;

  void onChange1(value) {
    selectedValue1 = value;
  }

  void onChange2(value) {
    selectedValue2 = value;
  }
}