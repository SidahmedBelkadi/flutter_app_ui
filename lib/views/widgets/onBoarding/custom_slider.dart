import 'package:course/controllers/onboarding_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingSlider extends GetView<OnBoardingController> {
  const CustomOnBoardingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.onPageChanged(value),
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 50),
            Text(
              onBoardingList[index].title!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            Image.asset(
              onBoardingList[index].image!,
              fit: BoxFit.fill,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 80),
            Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
