import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashScreen();
    super.onInit();
  }

  Future splashScreen() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    //Get.offNamed(SignIn.routeName);
  }
}
