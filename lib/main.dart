import 'package:api/save_data.dart';
import 'package:api/screen/home_screen.dart';
import 'package:api/screen/login_screen.dart';
import 'package:api/screen/product_screen.dart';
import 'package:api/screen/regisert_screen.dart';
import 'package:api/screen/splash_screen.dart';
import 'package:api/theme/service_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await AppPreferences().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        getPages: [
          GetPage(
            name: "/login_screen",
            page: () => const LoginScreen(),
          ),
          GetPage(
            name: "/register_screen",
            page: () => const RegisterScreen(),
          ),
          GetPage(
            name: "/home_screen",
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: "/product_screen",
            page: () => const ProductScreen(),
          ),
        ]);
  }
}
