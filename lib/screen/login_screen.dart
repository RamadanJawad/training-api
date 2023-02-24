import 'package:api/api/api_auth.dart';
import 'package:api/model/user.dart';
import 'package:api/save_data.dart';
import 'package:api/widget/custom_button.dart';
import 'package:api/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
                controller: emailController,
                hintText: "Enter your email",
                icon: Icon(Icons.email)),
            const SizedBox(
              height: 10,
            ),
            CustomField(
                controller: passwordController,
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
                  await performLogin();
                })
          ],
        ),
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          "Enter Your Email & Password",
          style: GoogleFonts.cairo(),
        )));
    return false;
  }

  Future login() async {
    User? user = await ApiAuthController()
        .login(email: emailController.text, password: passwordController.text);
    if (user != null) {
      await AppPreferences().save(user);
      Navigator.popAndPushNamed(context, "/home_screen");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
            "login failed , please try again",
            style: GoogleFonts.cairo(),
          )));
    }
  }
}
