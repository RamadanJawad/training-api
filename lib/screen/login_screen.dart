import 'package:api/controller/login_controller.dart';
import 'package:api/widget/custom_button.dart';
import 'package:api/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          "Login Screen",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            CustomField(
                controller:controller.emailController,
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
                    Navigator.pushReplacementNamed(context, "/register_screen");
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
                title: "Login",
                onPressed: () async {
                  await controller.performLogin();
                })
          ],
        ),
      ),
    );
  }
}
