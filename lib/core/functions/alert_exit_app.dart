import 'dart:io';

import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertDoYouWantToExitTheApp() {
  Get.defaultDialog(
    title: "Attention",
    middleText: "Do you want to exit the Application",
    actions: [
      MaterialButton(
        onPressed: () => exit(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.primaryColor,
        child: Text(
          "Confirm",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      MaterialButton(
        onPressed: () => Get.back(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.primaryColor,
        child: Text(
          "Cancel",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    ],
  );
  return Future.value(true);
}
