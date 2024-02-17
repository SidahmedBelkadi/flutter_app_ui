import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordControllerAbs extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgotPasswordController extends ForgotPasswordControllerAbs {
  late TextEditingController email;
  @override
  checkEmail() {
    // TODO: implement checkEmail
  }

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoutes.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
