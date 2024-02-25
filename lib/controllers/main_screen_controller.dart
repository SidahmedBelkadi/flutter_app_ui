import 'package:course/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class MainScreenControllerAbs extends GetxController {
  changeScreen(int index);
}

class MainScreenController extends MainScreenControllerAbs {
  List<Widget> screens = [
    const HomeScreen(),
    const Center(
      child: Text("Settings"),
    ),
    const Center(
      child: Text("Profile"),
    ),
    const Center(
      child: Text("Favorites"),
    ),
  ];

  List<String> screensTitles = ['Home', 'Settings', 'Profile', 'Fav'];

  List screeensIcons = [
    Icons.home_outlined,
    Icons.settings_outlined,
    Icons.person_outline,
    Icons.favorite_outline
  ];

  int currentScreen = 0;

  @override
  changeScreen(int index) {
    currentScreen = index;
    update();
  }
}
