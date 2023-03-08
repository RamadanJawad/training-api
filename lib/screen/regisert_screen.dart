import 'package:api/controller/register_controller.dart';
import 'package:api/widget/custom_button.dart';
import 'package:api/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
       
        title: Text(
          "Register Screen",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            CustomField(
                controller: controller.usernameController,
                hintText: "Enter your username",
                icon: Icon(Icons.person)),
            const SizedBox(
              height: 10,
            ),
            CustomField(
                controller: controller.emailController,
                hintText: "Enter your email",
                icon: Icon(Icons.email)),
            const SizedBox(
              height: 10,
            ),
            CustomField(
                controller: controller.passwordController,
                hintText: "Enter your password",
                icon: Icon(Icons.lock)),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: GoogleFonts.cairo(
                      fontSize: 17, color: Colors.black.withOpacity(0.6)),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed("/login_screen");
                  },
                  child: Text("Sign Up",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Register",
                onPressed: () async {
                  await controller.performRegister();
                })
          ],
        ),
      ),
    );
  }
}