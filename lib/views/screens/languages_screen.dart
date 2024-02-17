import 'package:course/controllers/localization_controller.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/widgets/languages/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesScreen extends GetView<LocalizationController> {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "choose_lang".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: 50),
              CustomLanguagesButton(
                  textButton: "Ar",
                  onPressed: () {
                    controller.chnageLanguage("ar");
                    Get.toNamed(AppRoutes.onBoarding);
                  }),
              const SizedBox(height: 20),
              CustomLanguagesButton(
                textButton: "En",
                onPressed: () {
                  controller.chnageLanguage("en");
                  Get.toNamed(AppRoutes.onBoarding);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
