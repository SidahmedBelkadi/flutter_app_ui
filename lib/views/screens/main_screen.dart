import 'package:course/controllers/main_screen_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    return GetBuilder<MainScreenController>(
      builder: (controller) => Scaffold(
        floatingActionButton: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            mini: false,
            backgroundColor: AppColors.primaryColor,
            // elevation: 20,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.card_travel_outlined),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: controller.screens.elementAt(controller.currentScreen),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (MainScreenController controller) {
        return BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          elevation: 5,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.screens.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomBottomAppBarItem(
                      title: controller.screensTitles[i],
                      icon: controller.screeensIcons[i],
                      onPressed: () => controller.changeScreen(i),
                      active: controller.currentScreen == i,
                    );
            }),
          ),
        );
      },
    );
  }
}

class CustomBottomAppBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final bool active;

  const CustomBottomAppBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color:
                  active ? AppColors.secondaryColor : AppColors.primaryColor),
          Text(
            title,
            style: TextStyle(
              color: active ? AppColors.secondaryColor : AppColors.primaryColor,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
