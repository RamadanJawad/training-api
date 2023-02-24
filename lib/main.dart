import 'package:api/save_data.dart';
import 'package:api/screen/home_screen.dart';
import 'package:api/screen/login_screen.dart';
import 'package:api/screen/product_screen.dart';
import 'package:api/screen/regisert_screen.dart';
import 'package:api/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        "/login_screen": (context) => LoginScreen(),
        "/register_screen": (context) => RegisterScreen(),
        "/home_screen": (context) => HomeScreen(),
        "/product_screen": (context) => ProductScreen()
      },
    );
  }
}
