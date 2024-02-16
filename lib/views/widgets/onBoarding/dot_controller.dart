import 'package:course/controllers/onboarding_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingDotController extends StatelessWidget {
  const CustomOnBoardingDotController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingList.length,
        (index) => GetBuilder<OnBoardingController>(
          builder: (controller) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              height: 5,
              width: controller.currentScreen == index ? 20 : 5,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}
