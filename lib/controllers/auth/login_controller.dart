import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  login();
  goToSignUp();
  goToForgotPassword();
}

class LoginController extends LoginControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isObsecurePassword = true;

  showPassword() {
    print("hello");
    isObsecurePassword = !isObsecurePassword;
    update();
  }

  @override
  login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("======================== Go To Home Screen ================");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.register);
  }

  @override
  goToForgotPassword() {
    Get.offNamed(AppRoutes.forgotPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
