import 'package:api/api/api_auth.dart';
import 'package:api/model/user.dart';
import 'package:api/widget/custom_button.dart';
import 'package:api/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
                controller: usernameController,
                hintText: "Enter your username",
                icon: Icon(Icons.person)),
            const SizedBox(
              height: 10,
            ),
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
                    Navigator.pushReplacementNamed(context, "/login_screen");
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
                  await performRegister();
                })
          ],
        ),
      ),
    );
  }

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

  Future register() async {
    User? user = await ApiAuthController().register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      Navigator.popAndPushNamed(context, "/login_screen");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(
            "Account created successfully",
            style: GoogleFonts.cairo(),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
            "login register , please try again",
            style: GoogleFonts.cairo(),
          )));
    }
  }
}