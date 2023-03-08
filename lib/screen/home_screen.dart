import 'package:api/home/category_screen.dart';
import 'package:api/home/country_screen.dart';
import 'package:api/home/get_image.dart';
import 'package:api/home/search_screen.dart';
import 'package:api/home/user_screen.dart';
import 'package:api/theme/service_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> screen = [UserScreen(), CategoryScreen(), CountryScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => GetImage());
                    },
                    icon: Icon(Icons.image)),
                IconButton(
                    onPressed: () {
                      Get.to(() => SearchScreen());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        ThemeService().changeTheme();
                      });
                    },
                    icon: ThemeService().isSavedDarkMode()
                        ? Icon(Icons.dark_mode_rounded)
                        : Icon(Icons.light_mode)),
              ])),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Users"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Country")
          ]),
      body: screen[index],
    );
  }
}
