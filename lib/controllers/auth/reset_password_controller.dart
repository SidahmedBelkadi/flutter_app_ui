import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControllerAbs extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordController extends ResetPasswordControllerAbs {
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  @override
  void onInit() {
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  resetPassword() {
    // TODO: implement resetPassword
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResePassword);
  }
}
