import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordControllerAbs extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgotPasswordController extends ForgotPasswordControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  @override
  checkEmail() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToVerifyCode();
    }
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
