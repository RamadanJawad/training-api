import 'package:api/save_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (AppPreferences().loggedIn) {
        Navigator.pushReplacementNamed(context, "/home_screen");
      } else {
        Navigator.pushReplacementNamed(context, "/login_screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Text(
              "RestFul Api",
              style: GoogleFonts.cairo(fontSize: 25, color: Colors.white),
            ),
          ),
          const Spacer(),
          const CupertinoActivityIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
