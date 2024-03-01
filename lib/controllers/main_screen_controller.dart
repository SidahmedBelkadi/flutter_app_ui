import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/screens/home_screen.dart';
import 'package:course/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class MainScreenControllerAbs extends GetxController {
  changeScreen(int index);
  goToCartScreen();
}

class MainScreenController extends MainScreenControllerAbs {
  List<Widget> screens = [
    const HomeScreen(),
    const Center(
      child: Text("Notifdications"),
    ),
    const SettingsScreen(),
    const Center(
      child: Text("Profile"),
    ),
  ];

  List screeensIcons = [
    Icons.home_outlined,
    Icons.notifications_outlined,
    Icons.settings_outlined,
    Icons.person_outline,
  ];

  List screeensIconsActive = [
    Icons.home,
    Icons.notifications,
    Icons.settings,
    Icons.person,
  ];

  int currentScreen = 0;

  @override
  changeScreen(int index) {
    currentScreen = index;
    update();
  }

  @override
  goToCartScreen() {
    Get.toNamed(AppRoutes.cart);
  }
}
