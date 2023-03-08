import 'package:api/controller/splash_controller.dart';
import 'package:api/save_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Text(
              "RestFul Api",
              style: GoogleFonts.cairo(fontSize: 25),
            ),
          ),
          const Spacer(),
          const CupertinoActivityIndicator(
            
          )
        ],
      ),
    );
  }
}
