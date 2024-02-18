import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailControllerAbs extends GetxController {
  checkEmail();
  goVerifyCodeSignUp();
}

class CheckEmailController extends CheckEmailControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  @override
  checkEmail() {
    var formData = formState.currentState;

    if (formData!.validate()) {
      goVerifyCodeSignUp();
    }
  }

  @override
  goVerifyCodeSignUp() {
    Get.offNamed(AppRoutes.verifyCodeSignUp);
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
