import 'package:course/controllers/main_screen_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/nav_bar/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.put(MainScreenController());
    return GetBuilder<MainScreenController>(
      builder: (controller) => Scaffold(
        floatingActionButton: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            mini: false,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.black,
            elevation: 0,
            onPressed: () => mainScreenController.goToCartScreen(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.card_travel_outlined),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        resizeToAvoidBottomInset: false,
        body: controller.screens.elementAt(controller.currentScreen),
      ),
    );
  }
}
