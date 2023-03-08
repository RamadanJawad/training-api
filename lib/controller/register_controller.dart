import 'package:api/api/api_auth.dart';
import 'package:api/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  Future performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    }

    Get.snackbar("Error of Validation", "Enter your email & password");
    return false;
  }

  Future register() async {
    User? user = await ApiAuthController().register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      Get.offNamed("/login_screen");
      Get.snackbar("", "Account created successfully");
    } else {
      Get.snackbar("Field register", "please try again");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
