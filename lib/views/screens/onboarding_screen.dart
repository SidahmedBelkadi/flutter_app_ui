import 'package:course/controllers/onboarding_controller.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/widgets/onBoarding/custom_button.dart';
import 'package:course/views/widgets/onBoarding/custom_slider.dart';
import 'package:course/views/widgets/onBoarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Dependency injection of onBoarding controller
    Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomOnBoardingSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const CustomOnBoardingDotController(),
                  const Spacer(flex: 2),
                  const CustomOnBordingButton(),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.login),
                    child: Text(
                      "skip".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
