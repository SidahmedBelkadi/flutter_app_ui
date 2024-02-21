import 'package:course/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppSnackBar {
  static errorSnackBar({required String title, required String message}) {
    return Get.snackbar("Warning", message,
        duration: const Duration(seconds: 3),
        backgroundColor: const Color.fromARGB(255, 255, 222, 102),
        colorText: Colors.black,
        icon: LottieBuilder.asset(AppImage.warning));
  }
}
