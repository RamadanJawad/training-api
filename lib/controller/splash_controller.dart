import 'package:api/save_data.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      if (AppPreferences().loggedIn) {
        Get.offNamed("/home_screen");
      } else {
        Get.offNamed("/login_screen");
      }
    });
  }
}