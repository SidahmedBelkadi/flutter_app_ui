import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterControllerAbs extends GetxController {
  register();
  goToLogin();
  goVerifyCodeSignUp();
}

class RegisterController extends RegisterControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  register() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goVerifyCodeSignUp();
    } else {
      print("======================== Not Valide ================");
    }
  }

  @override
  goVerifyCodeSignUp() {
    Get.offNamed(AppRoutes.verifyCodeSignUp);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }
}
