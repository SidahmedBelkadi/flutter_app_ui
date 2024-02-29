import 'package:course/controllers/auth/logout_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertDoYouWantToLogout() {
  LogoutController logoutController = Get.put(LogoutController());
  Get.defaultDialog(
    title: "Attention",
    middleText: "Do you want to logout ?",
    actions: [
      MaterialButton(
        onPressed: () => logoutController.logout(),
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
}
