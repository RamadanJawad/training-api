import 'package:api/api/api_auth.dart';
import 'package:api/model/user.dart';
import 'package:api/save_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }

    Get.snackbar("Error of Login", "login failed , please try again");
    return false;
  }

  Future login() async {
    User? user = await ApiAuthController()
        .login(email: emailController.text, password: passwordController.text);
    if (user != null) {
      await AppPreferences().save(user);
      Get.offNamed("/home_screen");
    } else {
      Get.snackbar("Error of Validation", "Enter your email & password");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
