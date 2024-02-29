import 'package:course/controllers/main_screen_controller.dart';
import 'package:course/views/widgets/nav_bar/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          // elevation: 1,
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
