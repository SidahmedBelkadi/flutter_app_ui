import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingControllerAbs extends GetxController {
  next();
  onPageChanged(int index);
  goToLogin();
}

class OnBoardingController extends OnBoardingControllerAbs {
  static String onBoarding = "onBoarding";

  Services services = Get.find();

  late PageController pageController;
  int currentScreen = 0;

  @override
  next() {
    currentScreen++;
    if (currentScreen > onBoardingList.length - 1) {
      goToLogin();
    }
    pageController.animateToPage(currentScreen,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentScreen = index;
    update();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
    services.sharedPreferences.setBool(onBoarding, true);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
